KERNEL=kernel7
umount /dev/mmcblk0p1
umount /dev/mmcblk0p2
mkdir -p mnt
mkdir -p mnt/fat32
mkdir -p mnt/ext4
sudo mount /dev/mmcblk0p1 mnt/fat32
sudo mount /dev/mmcblk0p2 mnt/ext4
sudo make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=mnt/ext4 modules_install
sudo cp mnt/fat32/$KERNEL.img mnt/fat32/$KERNEL-backup.img
sudo cp arch/arm/boot/zImage mnt/fat32/$KERNEL.img
sudo cp arch/arm/boot/dts/*.dtb mnt/fat32/
sudo cp arch/arm/boot/dts/overlays/*.dtb* mnt/fat32/overlays/
sudo cp arch/arm/boot/dts/overlays/README mnt/fat32/overlays/
sync
sudo umount mnt/fat32
rmdir mnt/fat32
sudo umount mnt/ext4
rmdir mnt/ext4
rmdir mnt

