#!/bin/bash

start()
{
	export PATH=$(pwd)/../../sources/bitbake/bin:$PATH
	bitbake core-image-sato
}

flash1()
{
	#https://blog.lazy-evaluation.net/posts/linux/bmaptool.html
	time sudo bmaptool copy /run/media/waldi/4C47-78FE/raspberrypi3-64/core-image-sato-raspberrypi3-64-20221105144918.rootfs.wic.bz2 /dev/sdb
}

flash2()
{
	#https://blog.lazy-evaluation.net/posts/linux/bmaptool.html
	time ( bzcat /run/media/waldi/4C47-78FE/raspberrypi3-64/core-image-sato-raspberrypi3-64-20221105144918.rootfs.wic.bz2 | sudo dd of=/dev/sdb bs=1M conv=fsync )
}
