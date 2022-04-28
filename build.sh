#!/bin/bash

KDIR=$1
true ${KDIR:=/opt/FriendlyARM/build/linux}
true ${DEST:=/tmp/r5-modules}

function r8125_build() {
	echo "Kernel source: ${KDIR}"
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux- KSRC=${KDIR}
}

function r8125_install() {
	local KREL=$(cd ${KDIR} && make kernelrelease)

	mkdir -p ${DEST}/lib/modules/${KREL}/extra
	cp r8125.ko ${DEST}/lib/modules/${KREL}/extra/ -afv
}

r8125_build && r8125_install

