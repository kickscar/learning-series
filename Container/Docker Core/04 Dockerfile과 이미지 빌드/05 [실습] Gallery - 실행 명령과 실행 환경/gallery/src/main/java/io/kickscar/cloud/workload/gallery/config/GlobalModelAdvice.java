package io.kickscar.cloud.workload.gallery.config;

import io.kickscar.cloud.workload.gallery.runtime.HostIdentity;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class GlobalModelAdvice {
    private final HostIdentity hostIdentity;

    /** 화면 푸터에 표시할 버전. 이미지 빌드 때 지정한다. 비어 있으면 표시하지 않는다. */
    @Value("${app.runtime.version:}")
    private String version;

    public GlobalModelAdvice(HostIdentity hostIdentity) {
        this.hostIdentity = hostIdentity;
    }

    @ModelAttribute("hostId")
    public String hostId() {
        return hostIdentity.getHostId();
    }

    @ModelAttribute("appVersion")
    public String appVersion() {
        return (version == null || version.isBlank()) ? null : version.trim();
    }
}
