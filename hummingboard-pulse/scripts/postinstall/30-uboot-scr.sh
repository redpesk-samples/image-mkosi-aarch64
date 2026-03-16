#!/bin/bash

set -e

echo "Create boot.scr needed by uboot in $BUILDROOT/boot/bootscript.txt ..."
cat <<'EOF' > $BUILDROOT/boot/bootscript.txt
setenv mmcroot /dev/mmcblk1p3 rootwait rw
setenv loadaddr 0x40400000
setenv fdt_addr_r 0x43000000
setenv bootargs console=ttymxc1,115200 root=${mmcroot} security=smack nohz_full=2 irqaffinity=0-1,3 rcu_nocbs=2 rcu_nocb_poll nosoftlockup
load mmc 1:2 ${loadaddr} Image
load mmc 1:2 ${fdt_addr_r} imx8mp-hummingboard-pulse.dtb
booti ${loadaddr} - ${fdt_addr_r}
EOF

mkimage -A arm -C none -T script -O u-boot -n "Redpesk boot script" -d $BUILDROOT/boot/bootscript.txt $BUILDROOT/boot/boot.scr
cat $BUILDROOT/boot/bootscript.txt
