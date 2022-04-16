#!/bin/sh
HOME='/home/ec2-user'
echo "========== new run ==========" >> $HOME/logs/run-log.txt
echo $(date) >> $HOME/logs/run-log.txt
# create service
cd /etc/systemd/system/
cat <<EOT >> myapp.service
[Unit]
Description=MyApp Service

[Service]
Restart=always
User=root
ExecStart=/usr/bin/serve -s /home/ec2-user/build -l 3000

[Install]
WantedBy=multi-user.target
EOT
systemctl start myapp.service &>> $HOME/logs/run-log.txt
echo "Started service." >> $HOME/logs/run-log.txt
echo "=============================" >> $HOME/logs/run-log.txt