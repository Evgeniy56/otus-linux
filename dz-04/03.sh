#!/bin/bash
# Добавление модуля в initrd
# Проверялось на Debian 9
#
cp -r ./01test /usr/lib/dracut/modules.d/
dracut -f --add test /boot/initrd.img-$(uname -r)
