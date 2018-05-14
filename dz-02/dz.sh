#!/bin/bash
yum install -y mdadm
mdadm --create /dev/md0 --metadata=0.90 --level=1 --raid-devices=2 /dev/sd{b,c}
mdadm --create /dev/md1 --metadata=0.90 --level=1 --raid-devices=2 /dev/sd{d,e}
mdadm --create /dev/md2 --metadata=0.90 --level=0 --raid-devices=2 /dev/md{0,1}
fdisk /dev/md2 << EOF
g
n


+100M
n


+100M
n


+100M
n


+100M
n



w
EOF
mkfs.ext3 /dev/md2p1
mkfs.ext3 /dev/md2p2
mkfs.ext3 /dev/md2p3
mkfs.ext3 /dev/md2p4
mkfs.ext3 /dev/md2p5
mkdir /mnt/disk1
mkdir /mnt/disk2
mkdir /mnt/disk3
mkdir /mnt/disk4
mkdir /mnt/disk5
mount /dev/md2p1 /mnt/disk1
mount /dev/md2p2 /mnt/disk2
mount /dev/md2p3 /mnt/disk3
mount /dev/md2p4 /mnt/disk4
mount /dev/md2p5 /mnt/disk5
mkdir /mnt/disk1/test
mkdir /mnt/disk2/test
mkdir /mnt/disk3/test
mkdir /mnt/disk4/test
mkdir /mnt/disk5/test
mkdir /etc/mdadm
echo "DEVICE partitions" > /etc/mdadm/mdadm.conf
mdadm --detail --scan | awk {print} >> /etc/mdadm/mdadm.conf
blkid /dev/md2p1 | awk 'BEGIN{FS="\"";RS=""} {print "UUID="$2" /mnt/disk1\text3\tdefaults\t1 2"}' >> /etc/fstab
blkid /dev/md2p2 | awk 'BEGIN{FS="\"";RS=""} {print "UUID="$2" /mnt/disk2\text3\tdefaults\t1 2"}' >> /etc/fstab
blkid /dev/md2p3 | awk 'BEGIN{FS="\"";RS=""} {print "UUID="$2" /mnt/disk3\text3\tdefaults\t1 2"}' >> /etc/fstab
blkid /dev/md2p4 | awk 'BEGIN{FS="\"";RS=""} {print "UUID="$2" /mnt/disk4\text3\tdefaults\t1 2"}' >> /etc/fstab
blkid /dev/md2p5 | awk 'BEGIN{FS="\"";RS=""} {print "UUID="$2" /mnt/disk5\text3\tdefaults\t1 2"}' >> /etc/fstab
