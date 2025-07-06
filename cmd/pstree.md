# Description

# Overview

# Options
-a
    show command line arguments

-p
    show pid of all sub-process

# Example
$ pstree -a -p 12345
    * see the process tree about process with pid 12345

$ pstree -s -s 12345
    * see all parents and child process of a given process

$ pstree -s -p 2048
    * show relation of processes
    systemd(1)───systemd(2070)───gnome-shell(2248)─┬─Xwayland(451386)─┬─{Xwayland}(451393)
                                               │                  ├─{Xwayland}(451394)
                                               │                  ├─{Xwayland}(451395)
                                               │                  ├─{Xwayland}(451396)
                                               │                  ├─{Xwayland}(451397)
                                               │                  ├─{Xwayland}(451398)
                                               │                  ├─{Xwayland}(451399)
                                               │                  ├─{Xwayland}(451400)
                                               │                  ├─{Xwayland}(451401)
                                               │                  ├─{Xwayland}(451402)
                                               │                  ├─{Xwayland}(451403)
                                               │                  └─{Xwayland}(451478)
                                               ├─gjs(2896)─┬─{gjs}(2898)
                                               │           ├─{gjs}(2899)
                                               │           ├─{gjs}(2900)
                                               │           ├─{gjs}(2901)
                                               │           ├─{gjs}(2902)
                                               │           ├─{gjs}(2903)
                                               │           ├─{gjs}(2904)
                                               │           ├─{gjs}(2905)
                                               │           ├─{gjs}(2906)
                                               │           ├─{gjs}(2907)
                                               │           ├─{gjs}(2908)
                                               │           ├─{gjs}(2913)
                                               │           └─{gjs}(2918)
                                               ├─mutter-x11-fram(451443)─┬─{mutter-x11-fram}(451447)
                                               │                         ├─{mutter-x11-fram}(451459)
                                               │                         ├─{mutter-x11-fram}(451460)
                                               │                         ├─{mutter-x11-fram}(451461)
                                               │                         ├─{mutter-x11-fram}(451462)
                                               │                         ├─{mutter-x11-fram}(451463)
                                               │                         ├─{mutter-x11-fram}(451464)
                                               │                         ├─{mutter-x11-fram}(451465)
                                               │                         ├─{mutter-x11-fram}(451466)
                                               │                         ├─{mutter-x11-fram}(451467)
                                               │                         ├─{mutter-x11-fram}(451468)
                                               │                         ├─{mutter-x11-fram}(451469)
                                               │                         ├─{mutter-x11-fram}(451470)
                                               │                         └─{mutter-x11-fram}(451471)
                                               ├─{gnome-shell}(2265)
                                               ├─{gnome-shell}(2266)
                                               ├─{gnome-shell}(2268)
                                               ├─{gnome-shell}(2269)
                                               ├─{gnome-shell}(2270)
                                               ├─{gnome-shell}(2271)
                                               ├─{gnome-shell}(2272)
                                               ├─{gnome-shell}(2273)
                                               ├─{gnome-shell}(2274)
                                               ├─{gnome-shell}(2275)
                                               ├─{gnome-shell}(2276)
                                               ├─{gnome-shell}(2277)
                                               ├─{gnome-shell}(2278)
                                               ├─{gnome-shell}(2280)
                                               ├─{gnome-shell}(2281)
                                               ├─{gnome-shell}(2282)
                                               ├─{gnome-shell}(2283)
                                               ├─{gnome-shell}(2284)
                                               ├─{gnome-shell}(2285)
                                               ├─{gnome-shell}(2289)
                                               ├─{gnome-shell}(2290)
                                               ├─{gnome-shell}(2291)
                                               ├─{gnome-shell}(2295)
                                               ├─{gnome-shell}(2296)
                                               ├─{gnome-shell}(2297)
                                               ├─{gnome-shell}(2298)
                                               ├─{gnome-shell}(2305)
                                               ├─{gnome-shell}(2726)
                                               ├─{gnome-shell}(2911)
                                               ├─{gnome-shell}(2943)
                                               ├─{gnome-shell}(2944)
                                               ├─{gnome-shell}(3238)
                                               ├─{gnome-shell}(4475)
                                               └─{gnome-shell}(5386)
