#!/bin/bash

/home/hu/bpf/llvm/build/bin/clang -O2 -emit-llvm \
    -nostdinc -isystem /home/hu/bpf/llvm/build/lib/clang/13.0.0/include/\
    -I../linux/include/uapi/asm-generic \
    -I../linux/tools/testing/selftests/bpf \
    -I../linux/tools/lib \
    -I../linux/arch/x86/include/generated \
    -I../linux/include \
    -I../linux/arch/x86/include \
    -I../linux/include/uapi \
    -I../linux/arch/x86/include/asm \
    -I../linux/arch/x86/include/generated/uapi \
    -I../linux/arch/x86/include/uapi \
    -I../linux/kernel/bpf/preload \
    --include ../linux/include/linux/kconfig.h \
    -D__KERNEL__ \
    -c poc_bpf.c -o - | /home/hu/bpf/llvm/build/bin/llc -march=bpf -filetype=obj -o poc_bpf.o

../linux/tools/bpf/bpftool/bpftool gen skeleton poc_bpf.o > poc_bpf_skel.h
