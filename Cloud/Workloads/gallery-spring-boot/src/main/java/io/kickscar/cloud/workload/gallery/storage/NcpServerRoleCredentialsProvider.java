package io.kickscar.cloud.workload.gallery.storage;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentials;
import software.amazon.awssdk.auth.credentials.AwsCredentialsProvider;
import software.amazon.awssdk.auth.credentials.AwsSessionCredentials;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;

/**
 * NCP Server Role 기반 키리스 자격증명 provider.
 *
 * VPC Server에 Server Role을 부여하면 metadata API로 임시 자격증명이 전달된다
 * (AWS IAM Role -> Instance Profile / Azure Managed Identity에 대응). 이 provider는
 * AWS SDK v2의 AwsCredentialsProvider를 구현해 NCP metadata API에서 임시 키를 받아
 * S3Client(NCP Object Storage)에 주입한다.
 *
 * TODO(실증 - Ch06 Object Storage draft): 아래 metadata endpoint 경로와 JSON 필드명은
 * 실제 Server Role 부여 서버에서 확인해 확정한다. 현재는 클라우드 metadata 표준
 * 링크로컬 주소 + 추정 경로/필드명으로 둔다. 정적 키 폴백(StaticCredentialsProvider)이
 * 있으므로 실증 전에도 앱은 정상 동작한다.
 */
@Slf4j
public class NcpServerRoleCredentialsProvider implements AwsCredentialsProvider {

    // 클라우드 metadata 표준 링크로컬 주소 (AWS/GCP 등 공통 관행)
    private static final String METADATA_BASE = "http://169.254.169.254";
    // TODO(실증): 정확한 자격증명 경로 확인
    private static final String CREDENTIALS_PATH = "/latest/meta-data/iam/security-credentials/";

    private final HttpClient httpClient = HttpClient.newBuilder()
            .connectTimeout(Duration.ofSeconds(2))
            .build();
    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public AwsCredentials resolveCredentials() {
        try {
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(METADATA_BASE + CREDENTIALS_PATH))
                    .timeout(Duration.ofSeconds(2))
                    .GET()
                    .build();

            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() != 200) {
                throw new IllegalStateException("NCP metadata API returned status " + response.statusCode());
            }

            JsonNode node = objectMapper.readTree(response.body());
            // TODO(실증): 실제 응답 필드명 확인 (accessKey/secretKey/sessionToken 추정)
            String accessKey = node.path("accessKey").asText(null);
            String secretKey = node.path("secretKey").asText(null);
            String sessionToken = node.path("sessionToken").asText(null);

            if (accessKey == null || secretKey == null) {
                throw new IllegalStateException("NCP metadata response missing credentials");
            }

            log.info("NcpServerRoleCredentialsProvider: temporary credentials resolved from metadata API");

            return (sessionToken != null && !sessionToken.isBlank())
                    ? AwsSessionCredentials.create(accessKey, secretKey, sessionToken)
                    : AwsBasicCredentials.create(accessKey, secretKey);

        } catch (Exception e) {
            throw new RuntimeException("Failed to resolve NCP Server Role credentials from metadata API", e);
        }
    }
}
