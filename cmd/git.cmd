## Noun
* HEAD
    * a pointer to pointer which branch yor are on now
    * check by $ cat .git/HEAD

* Remote
    * remote SERVER(github server); it's an alias of repo's remote URL

* Origin
    * it's a particular remote REPO

* master
    * the default BRANCH after creating a new repo

## Pull/fetch
* fetch means only fetch remote data to .git/FETCH_HEAD
    $ git fetch --all && git checkout <remotebranch>
        * fetch all remote branch data and checkout to a remote branch

    $ git fetch origin
        * fetch master branch from origin

    $ git fetch origin dev
        * fetch dev branch from origin

* pull
    * base on local .git/FETCH_HEAD, git fetch remote branch and git merge those data with local branch
    $ git pull origin master
        * fetch origin's master branch data and merge to local master branch
        * equal to $ git fetch origin master; git merge origin/master;
 

## Branch
* create branch
    $ git branch bugfix

* check current branch
    $ git branch

* rename a branch
    $ git branch -m <new-name>

* checkout to other branch
    $ git chechout bugfix

    $ git checkout -b sister
        * create and checkout to a non-exist branch

* delete a branch locally
    $ git branch -d bugfix
    $ git branch -D bugfix
        * if branch contain unmerged commits, need to use -D

* delete a branch on remote
    $ git push --delete origin bugfix

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

* recover from reset --hard
    $ git reflog show
        4d917ec (HEAD -> master) HEAD@{0}: reset: moving to HEAD~1
        76df500 HEAD@{1}: commit: add hash_table
        4d917ec (HEAD -> master) HEAD@{2}: commit: update util.h
        6371e12 (origin/master, origin/HEAD) HEAD@{3}: commit: update
    $ git reset HEAD@{1}


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

* show 10 lines of the context instead of 3 lines by default
    $ git diff -U10 path/to/file

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

* find commits with certain pattern in the committed files, can be used to find deleted lines
    $ git log -S "Ruby" path/to/file

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

* format-patch and am
    $ git format-patch -1 <commit-ish-here> -o <output-dir> -- drivers/gpu/drm/amd/display/
    $ git am -p6 <output-dir>/*.patch

* cherry-pick
    * the target commit is 55669487 on B branch, and want to cherry-pick this commit to branch A
    * first checkout to branch A, then:
    $ git cherry-pick 55669487

## rebase/merge/suqash
* rebase
    $ git rebase -i COMMIT
        * interactive mode to do rebase:
            * r: reword to commit msg
            * e: edit the code change

## SSH key authtication to allow git push without password
* gen the ssh key, copy the public key and paste to github account
* try it by
    $ ssh -T git@github.com
* on command line, enter the repo and type
    $ git remote set-url origin git@github.com:username/REPO.git

## Example
* done a commit and pushed it to remote master, but want to destory that commit
    $ git log --oneline
        * check which commit we want to reset
    $ git reset HASH
        * after that, HEAD will point to the commit of HASH
        * the modifications will become unstaged
        * continue to modify the code
    $ git commit
        * make a new commit
    $ git push --force
        * use --force to replace the unwanted commit in the remote master

* check remote URL
    $ git remote -v
