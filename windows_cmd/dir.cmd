* ls
    * add ls.bat under C:\Windows\System32 with the following content
        ```
        @dir %*
        ```
    * echo @dir %* > %systemroot%\system32\ls.bat

* pwd
    * add pwd.bat
        ```
        @echo %cd%
        ```
    * echo @echo %cd% > %systemroot%\system32\pwd.bat
