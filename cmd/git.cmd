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
    $ git checkout -- .
        * for all modification
    $ git checkout COMMIT
        * go to certain commit

* cancel git add before git commit 
    $ git reset

* cancel <file>'s git add before git commit
    $ git reset <file>

* cancel git commit before push
    $ git reset HEAD~1
        * $ git reset --hard HEAD~3
            * cancel the last 3 commit (be careful)
            * --hard will discard all change, including new files
        * if not adding --hard, then only HEAD moves, but your modification is still here


* only want to change commit msg after commit
    $ git reset --soft HEAD^
    $ git commit -m "new msg"

* temporarily stop work at hand, and drop/pop it later
    $ git stash
    $ git stash list
    $ git stash pop stash@{2}
        * will drop the stash
    $ git stash apply stash@{2}
        * will not drop the stash


## Show
* show diff between 2 commit
    $ git diff k73ud..dj374

* save git diff file
    $ git diff > my.diff

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

## Patch/Apply
* patch
    $ git apply ~/my.diff

* unpatch
    $ git apply -r ~/my.diff

* just check if we can seamlessly patch, but don't really patch
    $ git apply --check ~/my.diff
    $ git apply -R --check ~/my.diff

## SSH key authtication to allow git push without password
* gen the ssh key, copy the public key and paste to github account
* try it by
    * $ ssh -T git@github.com
* on command line, enter the repo and type
    * $ git remote set-url origin git@github.com:username/REPO.git

## Example
* done a commit and pushed it to remote master, but want to destory that commit
    * $ git log --oneline
        * check which commit we want to reset
    * $ git reset HASH
        * after that, HEAD will point to the commit of HASH
        * the modifications will become unstaged
        * continue to modify the code
    * $ git commit
        * make a new commit
    * $ git push --force
        * use --force to replace the unwanted commit in the remote master

