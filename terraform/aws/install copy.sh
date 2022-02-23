#! /bin/bash

# # 1 Install and start Jenkins 
# sudo apt-get update -y
# sudo apt-get install openjdk-11-jdk -y
# wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
# sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# sudo apt-get update -y
# sudo apt-get install -y jenkins
# sudo systemctl start jenkins
# sudo systemctl enable jenkins

# # 2 Install SonareQube

## STEP 01: Set kernel Parameters and System Limits
sudo echo "vm.max_map_count=262144 \n\
fs.file-max=65536 \n\
ulimit -n 65536 \n\

ulimit -u 4096" >> /etc/sysctl.conf

sudo echo 
"sonarqube   -   nofile   65536 \n\

sonarqube   -   nproc    4096" >> /etc/security/limits.conf

# ## STEP 02: Install and Configure PostgreSQL Database for SonarQube
# sudo apt update
# wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | sudo apt-key add -
# sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
# sudo apt install postgresql postgresql-contrib
# sudo systemctl enable postgresql. service
# sudo systemctl start  postgresql. service
# sudo passwd postgres
# su - postgres
# createuser sonar
# psql
# ALTER USER sonar WITH ENCRYPTED PASSWORD 'p@ssw0rd';
# CREATE DATABASE sonarqube OWNER sonar;
# GRANT ALL PRIVILEGES ON DATABASE sonarqube to sonar;
# q
# exit
# systemctl restart  postgresql
# systemctl status -l   postgresql

# ## STEP 03: Download and Install SonarQube
# sudo mkdir /sonarqube/
# cd /sonarqube/
# sudo curl -O https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-8.3.0.34182.zip
# sudo apt-get install zip
# sudo unzip sonarqube-8.3.0.34182.zip -d /opt/
# sudo mv /opt/sonarqube-8.3.0.34182/ /opt/sonarqube

# ## STEP 04: Create Group and User for SonarQube
# sudo groupadd sonar
# sudo useradd -c "SonarQube - User" -d /opt/sonarqube/ -g sonar sonar
# sudo chown sonar:sonar /opt/sonarqube/ -R

# ## STEP 05: Configure SonarQube
# sudo echo "sonar.jdbc.username=sonar" >> /opt/sonarqube/conf/sonar.properties
# sudo echo "sonar.jdbc.password=p@ssw0rd" >> /opt/sonarqube/conf/sonar.properties
# sudo echo "sonar.jdbc.url=jdbc:postgresql://localhost/sonarqube" >> /opt/sonarqube/conf/sonar.properties
# sudo echo "sonar.search.javaOpts=-Xmx512m -Xms512m -XX:+HeapDumpOnOutOfMemoryError" >> /opt/sonarqube/conf/sonar.properties

# ## STEP 06: Configure Systemd Service For SonarQube
# sudo echo "[Unit]" >> /etc/systemd/system/sonarqube.service
# sudo echo "Description=SonarQube service" >> /etc/systemd/system/sonarqube.service
# sudo echo "After=syslog.target network.target" >> /etc/systemd/system/sonarqube.service
# sudo echo "[Service]" >> /etc/systemd/system/sonarqube.service
# sudo echo "Type=forking" >> /etc/systemd/system/sonarqube.service
# sudo echo "ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start" >> /etc/systemd/system/sonarqube.service
# sudo echo "ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop" >> /etc/systemd/system/sonarqube.service
# sudo echo "User=sonar" >> /etc/systemd/system/sonarqube.service
# sudo echo "Group=sonar" >> /etc/systemd/system/sonarqube.service
# sudo echo "Restart=always" >> /etc/systemd/system/sonarqube.service
# sudo echo "LimitNOFILE=65536" >> /etc/systemd/system/sonarqube.service
# sudo echo "LimitNPROC=4096" >> /etc/systemd/system/sonarqube.service
# sudo echo "[Install]" >> /etc/systemd/system/sonarqube.service
# sudo echo "WantedBy=multi-user.target" >> /etc/systemd/system/sonarqube.service
# sudo systemctl daemon-reload 
# sudo systemctl enable sonarqube. service
# sudo systemctl start sonarqube. service
# sudo systemctl status -l sonarqube. service

# apt-get install nginx -y
# sudo echo "include /etc/nginx/conf.d/*.conf;" >> /etc/nginx/nginx.conf
# sudo echo "include /etc/nginx/sites-enabled/*;" >> /etc/nginx/nginx.conf

# sudo echo 
# "server{ \n\
#     listen      80; \n\
#     server_name sonarqube.da.com; \n\
#  \n\
#     access_log  /var/log/nginx/sonar.access.log; \n\
#     error_log   /var/log/nginx/sonar.error.log; \n\
#  \n\
#     proxy_buffers 16 64k; \n\
#     proxy_buffer_size 128k; \n\
#  \n\
#     location / { \n\
#         proxy_pass  http://127.0.0.1:9000; \n\
#         proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504; \n\
#         proxy_redirect off; \n\
#  \n\
#         proxy_set_header    Host            $host; \n\
#         proxy_set_header    X-Real-IP       $remote_addr; \n\
#         proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for; \n\
#         proxy_set_header    X-Forwarded-Proto http; \n\
#     } \n\

# }" >> /etc/nginx/sites-enabled/sonarqube.conf

# systemctl enable nginx.service 
# systemctl restart nginx.service
# systemctl status -l  nginx.service



# 3 Install Nexus

