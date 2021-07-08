#!/bin/bash

/home/hu/bpf/llvm/build/bin/clang \
    -I../linux/tools/lib \
    -L. \
    poc.c -o poc \
    -static -lbpf -lelf -lz

