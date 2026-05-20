#!/bin/bash
set -euo pipefail

APP_DIR=/opt/gallery
REPO_DIR=/home/ec2-user/workspace
JAR_PATH=/opt/gallery/gallery.jar
S3_BUCKET_NAME=aws-fund-gallery-bucket
RDS_CA_PATH=/opt/gallery/global-bundle.pem
DB_URL=jdbc:mariadb://aws-fund-gallery-db.cx2qocki04pk.ap-northeast-2.rds.amazonaws.com:3306/gallery?sslMode=trust
DB_USERNAME=gallery
DB_PASSWORD=gallery

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
chmod +x ./mvnw
./mvnw clean package -DskipTests -Dbuild.finalName=gallery
"

cp "${REPO_DIR}/Cloud/Workloads/gallery-spring-boot/target/gallery.jar" "${JAR_PATH}"
chown ec2-user:ec2-user "${JAR_PATH}"

curl -fsSL -o "${RDS_CA_PATH}" https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem
chown ec2-user:ec2-user "${RDS_CA_PATH}"
chmod 644 "${RDS_CA_PATH}"

cat >/etc/systemd/system/gallery.service <<EOF
[Unit]
Description=Gallery Spring Boot
After=network-online.target

[Service]
Type=simple
User=ec2-user
WorkingDirectory=/opt/gallery
ExecStart=/usr/bin/java -jar /opt/gallery/gallery.jar --spring.profiles.active=prod --app.storage.type=s3 --app.storage.s3.bucket="${S3_BUCKET_NAME}" --spring.datasource.url="${DB_URL}" --spring.datasource.username="${DB_USERNAME}" --spring.datasource.password="${DB_PASSWORD}"
Restart=always
RestartSec=5
SuccessExitStatus=143

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now gallery.service