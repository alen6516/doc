Mercurial (Hg) is a lightweight version control tool written in python

$ hg status
$ hg diff

$ hg pull -u
    * git pull
$ hg pull --rebase
    * git pull --rebase

$ hg shelve
    * git stash
$ hg shelve --name my-feature
$ hg unshelve
    * git stash pop

$ hg bookmark new_branch
    * git checkout -b new_branch
$ hg up old_branch
    $ git checkout old_branch

$ hg add <file>; hg ci -m "commit message"
    * commit change of new file
    $ hu ci <file> -m "commit message"

$ hg ci -m "commit message"
    * if not new file, just commit changes since mercurial doesn't have a staging area

## show
$ hg export .
$ hg log -r . -p
    $ git show HEAD
    * . means HEAD

$ hg log -l 5 --style oneline
    $ git log --oneline -5

$ hg log -G -l 5
    $ git log --oneline --graph -5
