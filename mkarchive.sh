if [ $# -ne 1 ]; then
	echo "Invalid Arg"
	exit 1
fi

DISK_IMG=disk.img
DISK_SIZE=200M
MNT_PATH=mnt
OUTPUT_PATH=output
TARGET=$1

mkdir $OUTPUT_PATH
qemu-img create -f raw $DISK_IMG $DISK_SIZE
mkfs.fat -n 'MIKAN OS' -s 2 -f 2 -R 32 -F 32 $DISK_IMG
mkdir -p $MNT_PATH
fusefat -o rw+ $DISK_IMG $MNT_PATH
mkdir -p mnt/EFI/BOOT
cp $TARGET $MNT_PATH/EFI/BOOT/BOOTX64.EFI
sudo umount $MNT_PATH
mv $DISK_IMG $OUTPUT_PATH/
