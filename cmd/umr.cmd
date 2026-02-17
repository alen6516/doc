# Description

# Overview
* install
    $ git clone https://gitlab.freedesktop.org/tomstdenis/umr.git
    $ sudo apt update
    $ sudo apt install build-essential libsdl2-dev cmake llvm llvm-dev libdrm-dev pkg-config libpciaccess-dev ncurses-term libncurses5-dev libncursesw5-dev libnanomsg-dev
    $ mkdir build && cd build/ && cmake ../
    $ sudo make
    $ sudo make install

# Options

# Example
$ sudo umr -lb
    * list all IP blocks

$ sudo umr -lr strix.vpe610
    * list all reg and their offsets within the ip block

$ sudo umr -s strix.vpe610
    * list reg value of given IP block

$ sudo umr -O bits -r navi14.gfx1010.mmPA_SC_VPORT_SCISSOR_0_BR
    * read reg value, -O bits will read by each fields
    * why sometimes see PMSG_1 = 0xffffffff? because it's secured chip, need to connect wombat to unlock first

$ sudo umr -O bits -w navi14.dcn301.mmHUBPREQ3_DCSURF_SURFACE_CONTROL 0x00000808
    * write reg value

* check the name of each ring
    $ cd /sys/kernel/debug/dri/0
    $ ls | grep amdgpu_ring

$ umr -RS <ring_name>

$ sudo umr -R gfx_0.0.0[1672:1686]
    * list content of gfx ring buffer from pointer 'from' to 'to' , including both RB and IB
    * the IB content will be listed following RB
    * First, you need to get the ring buffer name in sysfs node /sys/kernel/debug/dri/0

$ umr -R gfx[.:k]
    * Will read from the read pointer for ‘k’ words.

$ umr -R gfx[k:.]
    * will read from ‘k’ words before the write pointer.

$ umr --ring gfx[.]
    * will read the pending data in the ring the form ‘[.]’ may be used. This will read data from the ring read pointer to the ring write pointer.

$ umr --ring-stream vpe | grep -i error
    * if there is output, means vpe is not in use

* gui server & client
    $ umr --server tcp://0.0.0.0:12345
    $ umr --gui tcp://machineA-IP:12345
    * try to disable ubuntu firewall ufw beforehand

$ umr --gui
