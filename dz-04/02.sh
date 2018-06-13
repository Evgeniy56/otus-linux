#!/bin/bash
# Скрипт меняет название группы LVM и после изменении имени группы, 
# изменяет пораметры загрузки системы.
# $1 название старой группы
# $2 название новой группы
vgrename $1 $2
sed -i "s/mapper\/$1-/mapper\/$2-/g" /etc/fstab
sed -i "s/rd.lvm.lv=$1\//rd.lvm.lv=$2\//g" /etc/default/grub
sed -i "s/mapper\/$1-/mapper\/$2-/g" /boot/grub2/grub.cfg
sed -i "s/rd.lvm.lv=$1\//rd.lvm.lv=$2\//g" /boot/grub2/grub.cfg
