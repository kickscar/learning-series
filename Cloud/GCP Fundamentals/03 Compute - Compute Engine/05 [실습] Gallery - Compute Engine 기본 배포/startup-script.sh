#!/bin/bash
# Gallery Spring Boot — Compute Engine Startup Script
# Ch03 Gallery: Compute Engine 기본 배포
#
# 사전 조건:
#   - GCS 버킷에 gallery.jar 업로드 완료
#   - BUCKET_NAME을 실제 버킷 이름으로 변경

set -e

BUCKET_NAME="gcp-fund-gallery-staging-PROJECT_ID"   # 실제 버킷 이름으로 변경
APP_DIR="/app"
LOG_FILE="/var/log/gallery.log"

# ── 1. JDK 21 설치 (Adoptium Temurin) ──────────────────────────────────────
apt-get update -y
apt-get install -y wget apt-transport-https gpg

wget -qO - https://packages.adoptium.net/artifactory/api/gpg/key/public | \
  gpg --dearmor | \
  tee /etc/apt/trusted.gpg.d/adoptium.gpg > /dev/null

echo "deb https://packages.adoptium.net/artifactory/deb \
  $(awk -F= '/^VERSION_CODENAME/{print$2}' /etc/os-release) main" | \
  tee /etc/apt/sources.list.d/adoptium.list

apt-get update -y
apt-get install -y temurin-21-jre

# ── 2. JAR 다운로드 (GCS) ──────────────────────────────────────────────────
mkdir -p $APP_DIR
gsutil cp gs://$BUCKET_NAME/gallery.jar $APP_DIR/gallery.jar

# ── 3. GCE 인스턴스 이름 조회 ───────────────────────────────────────────────
INSTANCE_ID=$(curl -sf -H "Metadata-Flavor: Google" \
  http://metadata.google.internal/computeMetadata/v1/instance/name || echo "gallery-vm")

# ── 4. systemd 서비스 등록 및 시작 ─────────────────────────────────────────
cat > /etc/systemd/system/gallery.service << EOF
[Unit]
Description=Gallery Spring Boot App
After=network.target

[Service]
Type=simple
WorkingDirectory=$APP_DIR
ExecStart=/usr/bin/java -jar $APP_DIR/gallery.jar --app.runtime.instance-id=$INSTANCE_ID
Restart=on-failure
StandardOutput=append:$LOG_FILE
StandardError=append:$LOG_FILE

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable gallery
systemctl start gallery
