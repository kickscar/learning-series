#!/bin/bash
set -euo pipefail

APP_DIR=/opt/gallery
REPO_DIR=/home/ec2-user/workspace
JAR_PATH=/opt/gallery/gallery.jar

mkdir -p "${APP_DIR}"
chown -R ec2-user:ec2-user "${APP_DIR}"

sudo -u ec2-user bash -lc "
set -euo pipefail
cd /home/ec2-user
rm -rf workspace
git clone --filter=blob:none --sparse https://github.com/kickscar/learning-series.git workspace
cd workspace
git sparse-checkout init --no-cone
git sparse-checkout set Cloud/Workloads/gallery-spring-boot
cd Cloud/Workloads/gallery-spring-boot
./mvnw clean package -DskipTests -Dbuild.finalName=gallery
"

cp "${REPO_DIR}/Cloud/Workloads/gallery-spring-boot/target/gallery.jar" "${JAR_PATH}"
chown ec2-user:ec2-user "${JAR_PATH}"

cat >/etc/systemd/system/gallery.service <<EOF
[Unit]
Description=Gallery Spring Boot
After=network.target

[Service]
Type=simple
User=ec2-user
WorkingDirectory=/opt/gallery
ExecStart=/usr/bin/java -jar /opt/gallery/gallery.jar --spring.profiles.active=prod
Restart=always
RestartSec=5
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now gallery.service