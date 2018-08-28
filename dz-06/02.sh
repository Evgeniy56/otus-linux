#!/bin/bash
#Из epel установить spawn-fcgi и переписать init-скрипт на unit-файл. Имя сервиса должно так же называться.
#Работа проверялась на centOS 7
#
yum -y install epel-release
yum install spawn-fcgi
cp ./02file/spawn-fcgi.sevice /etc/systemd/system/
systemctl start spawn-fcgi
