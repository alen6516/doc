# Description

# Overview

* ldconfig, ld.so.conf, ld.so.cache
    * dynamic library search path is defined in /etc/ld.so.conf
    * after change this or /etc/ld.so.conf.d/*, need to use ldconfig to update ld.so.cache

* ldconfig命令的用途,主要是在默認搜尋目錄(/lib和/usr/lib)以及動態庫配置文件/etc/ld.so.conf內所列的目錄下,搜索出可共享的動態鏈接庫(格式如前介紹,lib*.so*),進而創建出動態裝入程序(ld.so)所需的連接和緩存文件.緩存文件默認為/etc/ld.so.cache,此文件保存已排好序的動態鏈接庫名字列表.

* when we export LD_LIBRARY_PATH=xxx in bash, it only take effects in current and its child bash, if we want to make it permanent
    * sudo vi /etc/ld.so.conf.d/XXXLibs.conf
        * add path/to/XXXlib.so
    * sudo ldconfig

# Options

# Example
* edit /etc/ld.so.conf to add the path of new lib
* then use ldconfig to update lib to /etc/ld.so.cache

$ ldconfig -p | grep libxxx
    * find the full path of a lib
    - there may be 2 libva.so.2, one from /opt/amdgpu/lib/x86_64-linux-gnu/ and another from /lib/x86_64-linux-gnu/
    - we can edit /etc/ld.so.conf.d/20-amdgpu.conf and sudo ldconfig to specify the preferred lib
    - or for libva, we can use $ env LIBVA_DRIVER_PATH="xxx" mpv to specify
