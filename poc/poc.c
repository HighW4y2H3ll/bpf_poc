#include "poc_bpf_skel.h"
#include <sys/shm.h>
#include <sys/ipc.h>

int main() {
    int err = 0;
    struct shm_info info = {0};
    struct poc_bpf *skel = poc_bpf__open_and_load();
    printf("bpf prog loaded\n");
    poc_bpf__attach(skel);

    int shmid = shmget(1337, 0x1000, IPC_CREAT|0777);
    if (shmid == -1) {
        printf("shm open error %d", errno);
        err = -1;
        goto out;
    }
    if (shmctl(shmid, SHM_INFO, &info) == -1) {
        printf("shmctl error %d", errno);
        err = -2;
        goto out;
    }
    for (int i = 0; i < sizeof(struct shm_info); i++) {
        if (i%16 == 0) printf("> ");
        printf(" 0x%02x ", ((char*)(&info))[i]);
        if (i%16 == 15) printf("\n");
    }
out:
    poc_bpf__destroy(skel);
    //struct bpf_object *obj;
    //obj = bpf_object__open("./poc_bpf.o");
    //bpf_object__load(obj);

    //struct bpf_program *prog = bpf_object__find_program_by_name(obj, "shmctl_hook");
    //if (!prog) {
    //    printf("find program failed\n");
    //    return -1;
    //}

    //struct bpf_link *link = bpf_program__attach_lsm(prog);

    //bpf_link__destroy(link);
    //bpf_object__close(obj);
    return err;
}
