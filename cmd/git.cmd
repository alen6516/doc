## Noun
* HEAD
    * a pointer to pointer which branch yor are on now
    * check by $ cat .git/HEAD

## Branch
* create branch
    $ git branch bugfix

* check current branch
    $ git branch

* rename a branch
    $ git branch -m bugfix my_patch

* checkout to other branch
    $ git chechout bugfix
        * create and checkout to a non-exist branch
            $ git checkout -b sister

* delete a branch
    $ git branch -d bugfix

* merge a branch (to current branch)
    $ git merge bugfix
        * if current branch is master, bugfix branch will be merged to master


## Recovery
* cancel modify before git add (be careful)
    $ git checkout -- <file>

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


## Show
* show diff between 2 commit
    $ git diff k73ud..dj374

* show branch
    $ git show-branch

* show merge history in graph
    $ git log --graph

* find commits by auther
    $ git log --oneline --auther="Sherly"
    * find A or B auther
    $ git log --oneline --auther="Sherly\|Eddie"

* find commits with certain msg
    $ git log --oneline --grep="WTF"

* find commits with certain pattern in the committed files
    $ git log -S "Ruby"

* find commits within a time period
    $ git log --oneline --since="9am" --until="12am" --after="2017-01"
