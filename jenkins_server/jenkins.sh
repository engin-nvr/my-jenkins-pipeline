#! /bin/bash
dnf update -y
hostnamectl set-hostname jenkins-server
dnf install git -y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
dnf upgrade
dnf install fontconfig java-17-amazon-corretto-devel -y
dnf install jenkins -y
systemctl enable jenkins
systemctl start jenkins
dnf install docker -y
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
usermod -a -G docker jenkins
systemctl daemon-reload
systemctl restart jenkins
curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
dnf install -y ansible
dnf install -y pip
pip install boto3
wget https://releases.hashicorp.com/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip
unzip terraform_1.9.5_linux_amd64.zip -d /usr/local/bin
