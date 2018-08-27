#!/bin/bash
#Дополнить юнит-файл apache httpd возможностьб запустить несколько инстансов сервера с разными конфигами
#Работа проверялась на centOS 7
#
cp /lib/systemd/system/httpd.servise /etc/systemd/system/httpd@test.service
mv /lib/systemd/system/httpd.servise /lib/systemd/system/httpd@.service
