#!/bin/sh -xe
OUTPUT_DIR=${1:-output}
./rkdeveloptool/rkdeveloptool ld
./rkdeveloptool/rkdeveloptool db $OUTPUT_DIR/rk3588_spl_loader_v*.bin
./rkdeveloptool/rkdeveloptool wl 0 $OUTPUT_DIR/u-boot-rockchip-spi.bin
./rkdeveloptool/rkdeveloptool rd
