#/bin/bash

sudo cp /home/heirat/bash-scripts/backup.sh /usr/local/bin/
sudo useradd -r backuper
sudo mkdir /var/backups/service-backups

sudo chmod +r /var/lib/service/
sudo chmod +w /var/backups/service-backups

sudo cp /home/heirat/bash-scripts/backup-task.service /etc/systemd/system
sudo cp /home/heirat/bash-scripts/backup-task.timer /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start backup-task.timer