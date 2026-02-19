#!/bin/sh -xe
cd trusted-firmware-a/
git clean -fxd
make PLAT=rk3588 bl31

cd ../u-boot/
git clean -fxd
export ROCKCHIP_TPL=../rkbin/bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.19.bin
export BL31=../trusted-firmware-a/build/rk3588/release/bl31/bl31.elf
make rock5b-rk3588_defconfig
make -j$(nproc)

cd ../rkbin/
git clean -fxd
./tools/boot_merger RKBOOT/RK3588MINIALL.ini

cd ..
rm -rf output && mkdir output
cp rkbin/rk3588_spl_loader_v*.bin u-boot/idbloader.img u-boot/u-boot.itb u-boot/u-boot-rockchip.bin u-boot/u-boot-rockchip-spi.bin output/
ls -la output/
