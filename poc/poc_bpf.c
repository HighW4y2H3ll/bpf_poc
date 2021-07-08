#include <uapi/linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <linux/bpf_lsm.h>

char _license[4] SEC("license") = "GPL";
SEC("lsm/shm_shmctl")
//int BPF_PROG(shmctl_hook, struct kern_ipc_perm *perm, int cmd, int ret) {
int shmctl_hook(struct kern_ipc_perm *perm, int cmd) {
    return 1;
}
