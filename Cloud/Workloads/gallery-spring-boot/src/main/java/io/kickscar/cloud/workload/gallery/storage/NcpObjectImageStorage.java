package io.kickscar.cloud.workload.gallery.storage;

import io.kickscar.cloud.workload.gallery.config.ImageStorageConfig.ImageStorageProperties;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.DeleteObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

import java.io.IOException;
import java.util.Optional;
import java.util.UUID;

/**
 * NCP Object Storage 연동.
 *
 * NCP Object Storage는 Amazon S3 API 호환이라 AWS SDK v2 S3Client를 그대로 사용한다.
 * endpoint(kr.object.ncloudstorage.com), region(kr-standard), credential은 Config에서
 * NCP용으로 주입한다. upload/delete 로직은 S3ImageStorage와 동일하고, 공개 URL 형식만
 * NCP path-style이다.
 *
 * TODO(실증 - Ch06 Object Storage draft): NCP 공개 객체 URL이 path-style
 * ({endpoint}/{bucket}/{key})인지 virtual-host style인지 실제 확인해 확정한다.
 */
@Slf4j
public class NcpObjectImageStorage implements ImageStorage {

    private final S3Client s3Client;
    private final ImageStorageProperties properties;

    public NcpObjectImageStorage(S3Client s3Client, ImageStorageProperties properties) {
        this.s3Client = s3Client;
        this.properties = properties;

        log.info("NcpObjectImageStorage Initialized [endpoint: {}, bucket: {}]",
                properties.ncp().endpoint(), properties.ncp().bucket());
    }

    @Override
    public String upload(MultipartFile file) {
        try {
            String fileName = "images/" + UUID.randomUUID() + Optional
                    .ofNullable(file.getOriginalFilename())
                    .filter(f -> f.contains("."))
                    .map(f -> f.substring(f.lastIndexOf(".")))
                    .orElse("");

            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(properties.ncp().bucket())
                    .key(fileName)
                    .contentType(file.getContentType())
                    .build();

            s3Client.putObject(putObjectRequest, RequestBody.fromBytes(file.getBytes()));

            // path-style: {endpoint}/{bucket}/{key}
            return String.format("%s/%s/%s",
                    properties.ncp().endpoint(), properties.ncp().bucket(), fileName);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void delete(String url) {
        // path-style URL에서 key 추출: {endpoint}/{bucket}/{key}
        String prefix = properties.ncp().endpoint() + "/" + properties.ncp().bucket() + "/";
        String key = url.substring(url.indexOf(prefix) + prefix.length());
        s3Client.deleteObject(DeleteObjectRequest.builder()
                .bucket(properties.ncp().bucket())
                .key(key)
                .build());
    }
}
