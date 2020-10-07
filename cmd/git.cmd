* cancel modify before git add (be careful)
git checkout -- <file>

* cancel git add before git commit 
$ git reset

* cancel <file>'s git add before git commit
$ git reset <file>

* cancel git commit before push
$ git reset HEAD~1
    * $ git reset --hard HEAD~3
        * cancel the last 3 commit (be careful)

* only want to change commit msg after commit
$ git reset --soft HEAD^
$ git commit -m "new msg"


* show branch
$ git show-branch

* show merge history in graph
$ git log --graph
