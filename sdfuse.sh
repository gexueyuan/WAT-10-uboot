

####################################
#<BL1 fusing>
reader_type1="/dev/sdc"
bl1_position=1
uboot_position=65

echo "BL1 fusing"
./sd_fusing/mkbl1 ./u-boot.bin SD-bl1-8k.bin 8192
dd iflag=dsync oflag=dsync if=SD-bl1-8k.bin of=$reader_type1 seek=$bl1_position
rm SD-bl1-8k.bin

####################################
#<u-boot fusing>
echo "u-boot fusing"
dd iflag=dsync oflag=dsync if=./u-boot.bin of=$reader_type1 seek=$uboot_position

####################################
#<Message Display>
echo "U-boot image is fused successfully."
echo "Eject SD card and insert it again."
