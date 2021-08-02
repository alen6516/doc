# Description

# Overview
* all tmux command can be:
    * <prefix>:$command
    * or in tmux, at shell's prompt enter "tmux $command"

# Options
    

# Example
$ tmux ls
    * list avaliable sessions in local tmux server

$ tmux at [ -t 0 ]
    * attach session [ 0 ]
    * if there is such tmux process but can not be attahced
        $ kill -s SIGUSR1 ${pidof_tmux} 
        $ tmux at

$ tmux kill-session -t 0
    * kill session 0

## ctrl-q

session 相關 |                                        
------------ | -------------------------------------- 
$            | rename session                         
s            | choose tree (session tree)             
new          | create new session
(            | switch back to the next session
)            | switch back to the previous session
L            | switch back to the previous used session

* share session to others on the same server
    * $ tmux -S /tmp/shared new -s shared
    * $ chmon 777 /tmp/shared
    * $ tmux -S /tmp/shared attach -t shared -r
        * -r means attach with readonly


window 相關  |                                        
------------ | -------------------------------------- 
, (comma)    | rename window                          
. (dot)      | change the number of a window          
0~9          | select window number #                 
w            | choose window (window tree)            
&            | kill window                            
f            | find window through name               
l            | last-used window
:move-window -t 0       將當前 window 移至編號 0 (最前)
:swap-window -s 4 -t 2  將編號 4 與 2 window 交換
:swap-window -t -1      move the window leftward by 1
:swap-window -t +1      move the window rightward by 1


pane 相關    |                                        
------------ | -------------------------------------- 
空白鍵       | 切換布局                               
q            | 顯示 pane 編號 ( 按下數字鍵可以切換到該pane)
o            | 切換到下個pane                         
{            | 與上個 pane 交換位置                   
}            | 與下個 pane 交換位置                   
;            | last pane                              
x            | kill pane                              
z            | zoom in/out the pane                   
>            | pane 邊界右移5單位                      
<            | pane 邊界左移5單位                      
+            | pane 邊界上移5單位                      
-            | pane 邊界下移5單位                      
ctrl-Arrow   | pane resize by 1
Alt-Arrow    | pane resize by 5
:break-pane  | 把當前的 pane 用一個新的 window 開啟   
:setw synchronize-panes on/off      | 同步/解除同步 pane (also can use for sending command to all pane)
:join-pain -s                       | join pane from certain window
:join-pain -t                       | join pane to certain window
:move-pane -t <sess name>:<wdw num> | move one pane to another session's window

其他         |                                        
------------ | -------------------------------------- 
?            | help
b            | send prefix                            
?            | list keys                              
d            | detach client                          
[            | 游標可以移動                               
<SPACE>      | start copy
<ENTER>      | copy text
]            | paste text
:set -g mouse on/off        允許滑鼠select window, select pane, resize pane

script for launch
    ```
    #!/bin/bash

    echo -n "Enter session name: "
    read sess_name

    tmux new-session -d -s $sess_name

    #tmux new-window -t $sess_name:1 -n "$sess_name"
    tmux new-window -t $sess_name:2 -n 'gdb'
    tmux new-window -t $sess_name:3 -n 'diff'

    tmux select-window -t $sess_name:1
    tmux -2 attach-session -t $sess_name
    ```
