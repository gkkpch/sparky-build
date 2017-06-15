#!/bin/bash
source $HOME/sparky-build/build.conf
cd $KERNELDIR
echo "Cleaning and preparing .config"
make clean
make $DEFCONFIG
make menuconfig
cp .config.old arch/arm/configs/$DEFCONFIG.old
cp .config arch/arm/configs/$DEFCONFIG
echo "Compiling dts"
make dtbs
echo "Compiling kernel"
make -j8 uImage
echo "Making modules"
make -j8 modules
echo "Saving to sparky platform folder"
rm -r $DESTDIR/sparky/lib
make modules_install ARCH=arm INSTALL_MOD_PATH=$DESTDIR/sparky/
make firmware_install ARCH=arm INSTALL_FW_PATH=$DESTDIR/sparky/lib/firmware
cp arch/arm/boot/uImage $DESTDIR/sparky/boot
cp arch/arm/boot/dts/$DTB $DESTDIR/sparky/boot/kernel.dtb
kver=`make kernelrelease`-`date +%Y.%m.%d-%H.%M`
rm $DESTDIR/sparky/boot/config*
cp .config $DESTDIR/sparky/boot/config-${kver}
cp .config $DESTDIR/sparky/config-${kver}
echo "Compressing sparky"
cd $DESTDIR
tar cvfJ sparky.tar.xz ./sparky
echo "Done"
