package io.kickscar.cloud.workload.gallery.config;

import io.kickscar.cloud.workload.gallery.storage.AzureBlobImageStorage;
import io.kickscar.cloud.workload.gallery.storage.ImageStorage;
import io.kickscar.cloud.workload.gallery.storage.LocalImageStorage;
import io.kickscar.cloud.workload.gallery.storage.NcpObjectImageStorage;
import io.kickscar.cloud.workload.gallery.storage.NcpServerRoleCredentialsProvider;
import io.kickscar.cloud.workload.gallery.storage.S3ImageStorage;
import com.azure.identity.DefaultAzureCredentialBuilder;
import com.azure.storage.blob.BlobContainerClient;
import com.azure.storage.blob.BlobServiceClientBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.regions.providers.DefaultAwsRegionProviderChain;
import software.amazon.awssdk.services.s3.S3Client;

import java.net.URI;
import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
@EnableConfigurationProperties(ImageStorageConfig.ImageStorageProperties.class)
public class ImageStorageConfig implements WebMvcConfigurer {

    private final ImageStorageProperties imageStorageProperties;

    @Autowired
    public ImageStorageConfig(ImageStorageProperties imageStorageProperties) {
        this.imageStorageProperties = imageStorageProperties;
    }

    /**
     * 업로드한 파일을 정적 리소스로 노출한다. 로컬 스토리지일 때만 필요하다.
     *
     * <p>{@code @ConditionalOnProperty}는 {@code @Bean} 메서드와 설정 클래스에서만 평가되고
     * 인터페이스 구현 메서드에는 적용되지 않으므로 여기서는 직접 확인한다.
     */
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        if (!"local".equals(imageStorageProperties.type())) {
            return;
        }
        registry.addResourceHandler(imageStorageProperties.baseUrl() + "/**")
                .addResourceLocations(Path.of(imageStorageProperties.resolvedLocalPath()).toUri().toString());
    }

    @Bean
    @ConditionalOnProperty(name = "app.storage.type", havingValue = "local")
    public ImageStorage localImageStorage() {
        return new LocalImageStorage(imageStorageProperties);
    }

    @Bean
    @ConditionalOnProperty(name = "app.storage.type", havingValue = "s3")
    public Region awsRegion() {
        return DefaultAwsRegionProviderChain.builder().build().getRegion();
    }

    @Bean
    @ConditionalOnProperty(name = "app.storage.type", havingValue = "s3")
    public S3Client s3Client(Region region) {
        return S3Client.builder()
                .region(region)
                .build();
    }

    @Bean
    @ConditionalOnProperty(name = "app.storage.type", havingValue = "s3")
    public ImageStorage s3ImageStorage(Region region, S3Client s3Client) {
        return new S3ImageStorage(region, s3Client, imageStorageProperties);
    }

    @Bean
    @ConditionalOnProperty(name = "app.storage.type", havingValue = "azure-blob")
    public BlobContainerClient blobContainerClient() {
        String endpoint = String.format("https://%s.blob.core.windows.net", imageStorageProperties.blob().account());
        return new BlobServiceClientBuilder()
                .endpoint(endpoint)
                .credential(new DefaultAzureCredentialBuilder().build())
                .buildClient()
                .getBlobContainerClient(imageStorageProperties.blob().container());
    }

    @Bean
    @ConditionalOnProperty(name = "app.storage.type", havingValue = "azure-blob")
    public ImageStorage azureBlobImageStorage(BlobContainerClient blobContainerClient) {
        return new AzureBlobImageStorage(blobContainerClient, imageStorageProperties);
    }

    @Bean
    @ConditionalOnProperty(name = "app.storage.type", havingValue = "ncp-object")
    public S3Client ncpS3Client() {
        ImageStorageProperties.Ncp ncp = imageStorageProperties.ncp();

        // 자격증명: 정적 키가 주어지면 정적, 없으면 Server Role(키리스) 폴백.
        // AWS(env/config -> IMDS) / Azure(DefaultAzureCredential)와 같은 우선순위.
        AwsCredentialsProvider credentialsProvider;
        if (ncp.accessKey() != null && !ncp.accessKey().isBlank()) {
            credentialsProvider = StaticCredentialsProvider.create(
                    AwsBasicCredentials.create(ncp.accessKey(), ncp.secretKey()));
        } else {
            credentialsProvider = new NcpServerRoleCredentialsProvider();
        }

        return S3Client.builder()
                .region(Region.of(ncp.region()))
                .endpointOverride(URI.create(ncp.endpoint()))
                .credentialsProvider(credentialsProvider)
                .forcePathStyle(true)
                .build();
    }

    @Bean
    @ConditionalOnProperty(name = "app.storage.type", havingValue = "ncp-object")
    public ImageStorage ncpObjectImageStorage(S3Client ncpS3Client) {
        return new NcpObjectImageStorage(ncpS3Client, imageStorageProperties);
    }

    @ConfigurationProperties(prefix = "app.storage")
    public record ImageStorageProperties(String type, Local local, S3 s3, Blob blob, Ncp ncp) {
        public record Local(String path, Url url) {}
        public record Url(String prefix) {}
        public record S3(String bucket) {}
        public record Blob(String account, String container) {}
        public record Ncp(String bucket, String endpoint, String region, String accessKey, String secretKey) {}

        public String baseUrl() {
            return local.url().prefix().replaceAll("/+$", "");
        }

        public String resolvedLocalPath() {
            if (local == null || local.path() == null) {
                throw new IllegalStateException("fs.path is required");
            }

            Path path = Paths.get(local.path());

            if (!path.isAbsolute()) {
                path = Paths.get(System.getProperty("user.dir")).resolve(path);
            }

            return path.normalize().toAbsolutePath().toString();
        }
    }
}
