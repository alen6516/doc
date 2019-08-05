## requirement
vim 7.4
vim 支援 lua (vim --version | grep lua)

## plug-in mamager
vim-plug

## general plug =======
plug name               | function
------------------------|:--------
nerdtree			    | nerdtree
vim-nerd-tree-direnter	| 允許 nerdtree 以 enter 在新的 tab 開檔
lightline			    | 美化狀態列, set laststatus=2
"junegunn/fzf           | 模糊查找工具
"gitsession             | git 相關
vim-multiple-cursor	    | 選取多重word一起修改
easymotion			    | 快速移動游標
undotree			    | undotree
indentLine			    | 縮排對齊線
restore-view		   	| 開啟檔案時回到上次游標停留的地方
wildfire			    | 快速選取區塊

## programming====
plug name               | function
------------------------|:--------
ctag				    | 非 vim plug, apt install 裝, see note below
tagbar				    | depend on ctag，變數、method 側欄
SrcExpl				    | 側欄顯示當前 method 定義處
syntastic			    | 預執行
nerdcommenter			| 快速註解
vim-easy-align			| 快速對齊

## 自動補齊
plug name               | function
------------------------|:--------
"neocomplete            | 自動補齊

## python 語言=====
plug name               | function
------------------------|:--------
vim-autopep8			| 重整python符合pep8風格，depend on autopep8

##js 語言=========
None

## plug 快捷鍵 (plug shortcut)
short cut   | function
------------|:--------
Shift + e	| nerdtree
Shift + r	| syntastic
Shift + s	| src explore
Shift + t	| tagbar
Shift + u	| undo tree
\\w         | easy-motion
\c<Space>   | commenter
ga          | easy-align
Ctrl + n	| multiple-cursor select

# 控制 (control)
short cut   | function
------------|:--------
qqq	        | q
Ctrl + l	| 行號開關
Ctrl + y	| file 間複製
Ctrl + p	| file 間貼上
Tab	        | indent
Shift + Tab	| unindent	# shift + tab 會被xhsell解析掉，而 vim 下 Ctrl+Tab = Tab

# 移動於 window 間 (move among windows)
short cut       | function
----------------|:--------
Ctrl-w-w        | move between windows
w + 上下左右    | Ctrl-w + 上下左右
ww              | Ctrl-w + w

# 移動於 tab 間 (move among tabs)
short cut           | function
--------------------|:--------
Ctrl+PageUp/Down    | move between tabs 
gt/gT		        | move between tabs

# 移動游標 (move cursor)
short cut   | function
------------|:--------
zz 		    | 將當前行移至螢幕中間
H		    | cursor移至螢幕頂端
L		    | cursor移至螢幕底端
M		    | cursor移至螢幕中間
{		    | 移至段落開頭
}		    | 移至段落結尾
$		    | 移至行首
0		    | 移至行末
^           | 移至第一個非空白字元
Ctrl + d    | 下移 10 行
Ctrl + u    | 上移 10 行
gg          | 移至檔首
g_          | 移至本行最後一個非空白字元
G           | 移至檔尾
nG          | 移至第 n 行行首
n<Space>    | 移至同列一行的第 n 字元
n<Enter>    | 向下移 n 行
w           | 移至下一個字字首
W           | 同上，但忽略一些標點符號
e           | 移至字尾
E           | 同上，但忽略一些標點符號
b           | 移至字首
B           | 同上，但忽略一些標點符號
%           | 游標在括弧上時，移至匹配的括弧上
:NUM        | 跳到第 NUM 行
''          | 回到剛才游標所在行

# 開檔時自動移動游標
vim myfile.txt +28  : 移動到該行
vim myfile.txt +/foo: 移動到第一次出現 pattern 處

# 進入插入模式 (enter insert mode)
short cut   | function
------------|:--------
i           | insert
I           | 在行首插入
a           | append
A           | 在行尾插入
o           | 在下一行開新行插入
O           | 在上一行開新行插入
J           | 將下一行一整行接至本行

# delete (刪除)
short cut   | function
------------|:--------
x           | 刪除游標所在字元
X           | 刪除游標前之字元
dd          | 刪除一整行
dw          | 刪除一個字(不適用中文)
dG          | 刪除至檔尾
dgg         | 刪除至檔首
D           | 刪除至行尾(含游標所在字元)
d0          | 刪除至行首(不含游標所在字元)
ctrl + h    | backspace
ctrl + w    | delete word in insert mode
c           | delete selected words and enter insert mode
cc          | delete whole line and enter insert mode

# replace (取代)
short cut   | function
------------|:--------
~           | 游標所在之處大小寫互換
u           | undo
U           | 在游標還沒移開本行前，回復所有編輯動作
Ctrl + R    | redo

# 排版
short cut   | function
------------|:--------
>>          | 整行向右一個 shiftwidth
<<          | 整行向左一個 shiftwidth
>nG         | 當前行到第 n 行向右縮排
<nG         | 當前行到第 n 行向左縮排
:ce         | 本行文字置中
:ri         | 本行文字靠右 (set textwidth 的長度)
:le         | 本行文字靠左

# copy & paste (複製 & 貼上)
short cut   | function
------------|:--------
yy          | 複製整行
y2y         | 複製 2 行
y^          | 複製至行首
y$          | 複製至行尾
yw          | 複製一個 word
yG          | 複製至檔尾
ygg         | 複製至檔首    
p           | 在游標後貼上
P           | 在游標前貼上

# folding (折疊)
short cut   | function
------------|:--------
zR          | 打開所有折疊
zM          | 關閉所有折疊
za          | toggle 折疊
zi          | toggle foldenable 的值
zj          | 移動游標到下一個折疊開始處
zk          | 移動游標到上一個折疊開始處
[z          | 移動游標到當前打開的折疊的開始處
]z          | 移動游標到當前打開的折疊的開始處

# registers (緩衝區)
short cut   | function
------------|:--------
"ayy        | 將本行複製到 a 緩衝區 (a 可為 26 字母其中一個，小寫的 a 會覆蓋，大寫的 A 會 append)
"ap         | 將 a 緩衝區的內容貼上

# The Big Command
short cut   | function
------------|:--------
.           | 重複:上一個動作

# search (尋找)
short cut   | function
------------|:--------
/           | 向下找
?           | 向上找
n           | 尋找下一個
N           | 尋找上一個
*           | 尋找游標所在之處的 word (要完全符合)
#           | 同上，不過是向上找
g****          | 同 * ，但部分符合即可
g#          | 同 # ，但部份符合即可

# substitute (替換)
:[range]s/pattern/string/[c,e,g,i]
description | function
------------|:--------
range       | 範圍 (可用 % 代表整篇文章)
pattern     | 就是要被替換掉的字串，支持 regexp
string      | 將 pattern 由 string 所取代
c           | confirm，每次替換前會詢問
e           | 不顯示 error
g           | globe，整行符合的 pattern 都替換
i           | ignore，不分大小寫

# marks (書籤)
short cut   | function
------------|:--------
mx          | mark 住游標所在位置 (x 可用英文字母或數字)
`x          | 回到書籤位置
'x          | 回到書籤設定行首行
:marks      | 書籤列表

# Macro (巨集)
short cut   | function
------------|:--------
qx          | 開始錄製巨集 (x 可用英文字母或數字)
@x          | 在當前位置播放巨集

usage of x  | function
------------|:--------
小寫字母    | 只作用於單一檔案內
大寫字母    | 可作用於編輯中之各檔案間
數目字 n    | 回到前 n+1 次編輯檔案的最後位置 (0 是前一次)

# buffer (多檔編輯)
short cut   | function
------------|:--------
:e 檔名     | 不離開 vim 的情形下再開其他檔案
:e#         | 編輯前一個檔案
Ctrl + ^    | 同上

short cut   | function
------------|:--------
:files      | 列出 buffer 中所有檔案
:buffers    | 同上
:ls         | 同上

short cut   | function
------------|:--------
:bn         | buffer next
:bl         | buffer last
:b 檔名     | 移至該檔
:b 編號     | 同上 (:ls 中會顯示各檔案的編號)
:bd         | 將檔案從 buffer list 中移除

short cut   | function
------------|:--------
:qa         | 多檔編輯下 :q 不會離開 vim，改用 :qa

# 標示
short cut   | function
------------|:--------
v           | 標示字元 (mouse 按著移動)
V           | 標示整行 (mouse 連按 3 次)
Ctrl + v    | 縱向標示

# Window (視窗)
short cut   | function
------------|:--------
:sp 檔名    | 開新視窗編輯檔案
Ctrl-w n    | 同 :new ，開新視窗
Ctrl-w s    | 以 :sp 將原檔再開一個新視窗
Ctrl-w q    | 結束分割出來的視窗
Ctrl-w o    | 同 :only! 使目前視窗成為唯一顯示的視窗，其他視窗會隱藏起來

# Shell command
short cut       | function
----------------|:--------
:! 指令         | 執行外部指令
:!!             | 執行前一次的外部指令 (在shell下，!! 是執行上次指令)
:sh             | 執行 shell ，用 exit 回來 (:set shell=/bin/bash)
:r !指令        | 在游標所在處次一行插入外部指令 commond 執行後的輸出內容 
:n,mw !command  | 以 n 至 m 行內之資料，當做外部指令 commond 的 input
K               | 顯示游標所在處之 word 的 manpage

# Set
short cut   | function
------------|:--------
:set        | 顯示所有和預設值不一樣的設定
:se         | 同上
:set all    | 顯示所有設定值
:set op?    | 顯示 op 這項設定的值
:set op=    | 直接設定 op
:set noop   | 取消 op 這項設定
    
## setting
short cut   | function
------------|:--------
ai          | 自動縮排，對齊上行的起始字元位置，預設不開
aw          | 檔案一有更動就自動存檔，預設不開
bg          | 預設 light
bk          | 是否備份檔案，預設不開
wb          | 檔案更動後，寫入前會先備份，預設開啟 (.swp 的由來)
bdir        | 設定存放備份檔的目錄，預設在檔案所在目錄
bin         | 設定為編輯二進位檔案的狀態，防止把 EOL 寫進二進位檔，編輯二進位檔案時開啟，預設 off
cin         | 專為寫 C/C++ indent，預設關閉，但寫 C/C++ 時自動開啟
ch          | 狀態列的行數，預設一行
cp          | 設為和原始 vi 相容的狀態，vim 的擴充功能會被抑制，預設 off
cf          | 各種確認動作，預設 off
dir         | 設定 .swp 檔存放的目錄
ff          | 寫入檔案時置放 EOL (end of line) 的形式，dos 是以 0D 0A 來斷行，unix/Linux 是以 0A 來斷行，mac 是以 0D 來斷行
ffs         | 指定多個 ff，會依載入的檔案形式來調整 ff。例如 :set ffs=unix,dos ff=unix 則預設為 unix 格式，但如讀入的是 dos 格式的檔案，會自動調整 為 dos 格式，這樣存檔時就會以 dos 格式存檔（狀態列會顯示）。 此時如要改成 unix 格式，可 set ff=unix 然後存檔就會轉成 unix 格式，反之亦然。 如果不這樣設，也就是不管 ff 或 ffs 都設成 unix， 那讀入 dos 格式的檔案時在每行尾會出現 ^M 這個字元（就是 0D ），這時縱使 :set ff=unix 也來不及了！只好 :%s/^M//g 來消去這個 ^M。 Hey，你怎麼知道是 0D 呀！把游標移到 ^M 那個位置，然後按 ga 在狀態列就會顯示 10，16，8 進位的值，其它的字元也是可以如此顯示。a 就是 ascii 的意思
ic          | 尋找時不分大小寫，這對中文會造成困擾。預設 off
is          | 加強式尋找功能，在鍵入時會立即移動至目前鍵入之patern 上，預設關閉
hls         | 尋找時，符合字串會反白表示。預設 off
tw          | 是一個 word wrap 的功能，從左起算之固定每行的最大字元寬度。 超過此寬度就會自動折行，是真的折行，也就是說在折行處會插 入 EOL。預設是 0，也就是沒有 word wrap 的功能。
wm          | 和 textwidth 作用相同，只是是從右視窗邊向左算起要幾個字元起 折行。預設是 0。textwidth 與 wrapmargin 的功能目前並不適用於中文
wrap        | 這也是折行功能，可是只是螢幕效果的折行，實際上並沒有插入 EOL
ws          | 尋找到底時，是否要從頭繼續尋找，預設是要
paste       | 防止在做剪貼時位置會不正確
ru          | 會在狀態列顯示游標所在處之行列狀態，預設關閉最右邊之代號的意義如下。 Top: 檔案第一行在螢幕可見範圍。 Bot:檔案最後一行在螢幕可見範圍。 All:檔案首尾皆在一個螢幕範圍內。如非以上三種情形，則會顯示相對百分比位置。
stl         | 狀態列顯示的格式，要調整請 :h stl
sw          | 由 >> 移動整行內容時，一次移動的字元寬度
ts          | 一個 tab 鍵的寬度，預設 8 字元
sc          | 在狀態列顯示目前執行的指令
smd         | 在狀態列顯示目前的模式
vb          | 關閉 vim 的 beep 聲，以閃爍游標取代
nu          | 顯示行號
list        | 將 tab 以 ^I 顯示，EOL 以 $ 顯示，以便辨別
swf         | 是否需 swap 至磁碟。如果設為 noswf 的話，那將不會有 swapfile 產生，通通會載入在記憶體中。預設是要 swapfile。
hi          | 記錄冒號命令的歷史記錄檔，預設 20 筆
fileencoding| 設定檔案編碼，預設 utf-8
softtabstop | softtab 是 vim 提供的假 tab，為避免動到真的 tab 的寬度設定，這個選項可調整這個假 tab 的寬度，要打出真的 tab 時，打 Ctrl-v Tab
linebreak   | 螢幕折行 (假折行)，但會在標點符號處折，中文判斷不支援

# 其他  
short cut   | function
------------|:--------
:h f        | 查詢按鍵用途
:f          | 顯示目前編輯的檔名、是否經過修改及目前游標所在之位置
Ctrl + g    | 同上
:f 檔名     | 改變編輯中的檔案檔名
:x          | 離開 vim，若檔案有變動則存檔後離開，若無則直接離開，不再存檔
:map        | 查詢快捷鍵
gg=G        | 修正整個檔案的縮排
=           | 修正反白部份的縮排 
15==        | 修正下方 15 行的縮排
vim -r 檔名 | 有 .swp 時緊急恢復
vim -x 檔名 | 加密檔案，以後要開檔時會要求輸入密碼
ctrl + a    | 遞增游標所在數字
ctrl + x    | 遞減游標所在數字
:set ff=dos | change ff to dos system (no change in appearance), Unix's ff is /r, dos is /r/n
<Ctrl-w> z  | close preview window (YCM hint will show in preview window)
K           | lookup a API in manpage
gd          | jump to the definition if function

# Note
- ctags
    - 非vim插件
    - 需在專案資料夾最上層產生tag檔，否則只能看到本檔裡的東西
        - ctags -R --exclude=.git .
    - 預設可用 ctrl+] 跳到函式定義處
        - 若定義處在不同檔，會開啟該檔在 vim buffer 裡
        - 或用 :tag function_name 跳過去

- tagbar
    - 利用ctag找到的函式名稱，用一個sidebar顯示
    - 好像只能顯示本檔
- Srcexpl
    - 利用 ctag，可以開一個 vim split window 跳到 ctags 找到的定義處
