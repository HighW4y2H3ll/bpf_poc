cmake /home/hu/bpf/llvm/llvm-project/llvm -G "Ninja" -DLLVM_TARGETS_TO_BUILD="BPF;X86" \
    -DCMAKE_INSTALL_PREFIX="/home/hu/llvm/install" \
    -DLLVM_ENABLE_PROJECTS="clang"    \
    -DCMAKE_BUILD_TYPE=Release        \
    -DLLVM_BUILD_RUNTIME=OFF
