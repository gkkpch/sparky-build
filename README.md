# sparky-build
Scripts to help build  Sparky image

#### Prerequisites


```
git squashfs-tools kpartx multistrap qemu-user-static samba debootstrap parted dosfstools qemu binfmt-support qemu-utils
```

#### How to
### Build Platform files
- clone the sparky kernel repo to your Home folder  : git clone http://github.com/sparkysbc/linux sparky-linux  
- clone the help scripts repo to your Home folder  : git clone http://github.com/gkkpch/sparky-build  





- clone the build repo on your Home folder  : git clone https://github.com/volumio/Build build  


It is recommended, not a necessity, to use Debian Jessie 8 (as that's what we are building for).  
If on Ubuntu, you may need to remove `$forceyes` from line 989 of /usr/sbin/multistrap  

- cd to /build and type  

```
./build.sh -b <architecture> -d <device> -v <version>
```

where switches are :
