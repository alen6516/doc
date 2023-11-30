# Description

# Overview
* similar coding style formatting tools: intent, astyle

* Ubuntu apt maintains old version of clang-format, use pip to install the newer one:
    *  python -m pip install clang-format

* doc to lookup the option
    * https://clang.llvm.org/docs/ClangFormatStyleOptions.html

# Options
--style=<style>
    * support llvm, google, chromium, mozilla, webkit, microsoft, GNU

--style=file:<config>
    * use <config> to do formatting
    * if didn't specify :<config>, will try to recursively find .clang-format from current directory

-i <file>
    * Inplace fixing the format of <file>

--verbose
    * show detailed message for tracking

# Example
$ clang-format --style=llvm --dump-config > .llvm-format
    $ generate a config file

$ clang-format --style=llvm myfile.c
    $ use llvm format to process myfile.c

$ clang-format --style=file:.llvm-format myfile.c
    $ use .llvm-format file to process myfile.c


* Only process the format of the changed code
    $ git add <file>
    $ git clang-format

* python script to process the all contained lines in git diff
    $ git diff -U0 --no-color --relative HEAD~ | python clang-format-diff.py -style=file:my_format -p1
    * script: https://github.com/llvm-mirror/clang/blob/master/tools/clang-format/clang-format-diff.py
    * reference: https://clang.llvm.org/docs/ClangFormat.html#script-for-patch-reformatting
