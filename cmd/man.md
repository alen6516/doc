* Linux 的線上手冊分為幾個主要的章節（sections），每個章節對應不同的類別：
    ```
    1：可執行的程式或是 shell 指令。
    2：系統呼叫（system calls，Linux 核心所提供的函數）。
    3：一般函式庫函數。
    4：特殊檔案（通常位於 /dev）。
    5：檔案格式與協定，如 /etc/passwd
    6：遊戲。
    7：雜項（巨集等，如 man(7)、groff(7)）。
    8：系統管理者指令（通常是管理者 root 專用的）。
    9：Kernel routines（非標準）。
    ```
    * 而在線上手冊中的文件都會以小括弧來標明該文件所屬的章節，例如 LS(1) 就代表這份文件隸屬於第 1 個章節。
    * 有些時候一個主題名稱在不同章節中有不同的說明文件，如果查詢一個主題的時候沒有指定章節，預設會依照 1 n l 8 3 2 3posix 3pm 3perl 5 4 9 6 7 這個順序來搜尋，然後顯示第一個搜尋到的章節。
    * 例如 passwd 這個主題有 passwd(1) 與 passwd(5) 兩個章節


* 對於某關鍵字，列出所有章節
    * $ man -aw printf
* 一次查詢所有章節
    * $ man -a printf

* 2 種方式獲得彩色的 man page
    * 使用 most 作為 pager
        ```bash
        apt install most
        export PAGER="most"
        ```
    * 在 .bachrc 加入以下設定
        ```bash
        # Less Colors for Man Pages
        export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
        export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
        export LESS_TERMCAP_me=$'\E[0m'           # end mode
        export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
        export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
        export LESS_TERMCAP_ue=$'\E[0m'           # end underline
        export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
        ```
