#!/bin/bash

/home/hu/bpf/qemu/build/qemu-system-x86_64 \
    -kernel ../linux/arch/x86_64/boot/bzImage \
    -append "root=/dev/sda console=ttyS0 earlyprintk nokaslr" \
    -hda ./buster.img \
    -nographic --enable-kvm -m 1G -smp 1 \
    -serial stdio -monitor none
