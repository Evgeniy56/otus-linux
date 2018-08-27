#!/bin/bash
#Написать сервис, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова. Файл и слово должны задаваться в /etc/sysconfig
#Работа проверялась на centOS 7
#
cp ./01file/searchlog.service /etc/systemd/system/
cp ./01file/searchlog.timer /etc/systemd/system/
cp ./01file/searchlog /etc/sysconfig/
sudo systemctl daemon-reload
sudo systemctl start searchlog.timer 
sudo systemctl start searchlog.service
