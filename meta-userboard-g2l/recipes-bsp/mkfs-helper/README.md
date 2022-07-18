## Introduction

### Prepare the exported rootfs

#### Edit the `/etc/exports` . 

```bash
/work/userboard-g2l/rootfs                   *(rw,sync,no_root_squash,no_subtree_check)
```

#### Restart the nfs-kernel-server service. 

```
sudo /etc/init.d/nfs-kernel-server restart
```
