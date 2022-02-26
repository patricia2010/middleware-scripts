#!/bin/bash
#Description: Sonarqube installation on CentOS7
#Author: Patricia Meche

echo "starting the intallation of sonarqube"
sleep 4
if [ ${USER} = root ]
then
echo "please loggin as a regular user"
exit 1
fi
echo "system updating"
sudo yum update -y
sudo unzip /opt/sonarqube-9.3.0.51899.zip
echo "changing ownership and starting the service"
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
./sonar.sh start
sudo firewall-cmd --permanent --add-port=9000/tcp
sleep 4
echo "Sonarqube has been successfully installed, connect through the brownzer using: http://<your-ip-address>:9000"    
sleep 4
sudo yum install net-tools -y
echo "your ip address is displayed below"
ifconfig