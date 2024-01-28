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
 
## clone
* shallow clone to speed up
    $ git clone --depth=1 <url>
        * clone only 1 commit

    $ git clone --depth 5 <url> --branch <branch>

    $ git clone --shallow-since=<date> <url>


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

* delete all branches other than master
    $ git branch | grep -v "master" | xargs git branch -D

* merge a branch (to current branch)
    $ git merge bugfix
        * if current branch is master, bugfix branch will be merged to master

* find branches the commit is on
    $ git branch -a --contains <commit>


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
    $ git stash show -p stash@{2}
        * check the diff but not apply
    $ git stash show -p > my.patch
        * stash the output into a patch file
    $ git apply --check my.patch && git apply my.patch
        * verify no errors and apply the patch


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

* find commits by author
    $ git log --oneline --author="Sherly"
    * find A or B author
    $ git log --oneline --author="Sherly\|Eddie"

* find commits with certain msg
    $ git log --oneline --grep="WTF"

* find commits with certain pattern in the committed files, can be used to find deleted lines
    $ git log -S "Ruby" path/to/file

* find commits modifying a specific function
    $ git log -L :myfunction:path/to/myfile.c

* find commits within a time period
    $ git log --oneline --since="9am" --until="12am" --after="2017-01"

* show history change of a file
    $ git log -p -- path/to/file

* find the order of 2 commits on the same branch
    $ git log --oneline | grep "1444f2416bd2\|e0ee0461b2e2" -n

* show commit history of a file graphically
    $ gitk path/to/file
        * need to enable X11-forwarding if connecting to linux via SSH


## git grep
# git grep is very similar. The main difference is that git grep defaults to searching in the files that are tracked by git
* find the keyword with line number
    $ git grep -n WORD

* count the times of keywork
    $ git grep -c WORD

* find keyword and show the function it is in
    $ git grep -p WORD *.c

* add a break and a heading for each search result for better viewing
    $ git grep --break --heading WORD

* search keyword to only .txt files
    $ git grep WORD -- *.txt
    $ grep -R --include=*.txt WORD .

* search keyword in the previous version of the repo
    $ git grep WORD HEAD~
    $ git checkout HEAD~; grep -R WORD ,; git checkout -

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
    $ git am -p6 xxx.patch
        $ git am --rej --directory=path/to/patch xxx.patch

* cherry-pick
    * the target commit is 55669487 on B branch, and want to cherry-pick this commit to branch A
    * first checkout to branch A, then:
    $ git cherry-pick 55669487
    $ git cherry-pick -n 55669487
        * cherry-pick but not commit, we can unstage some files and then commit, the message will be stored by cherry-pick

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

* remove a commit from history
    $ git rebase -i and use d for delete

* revert a commit
    $ git revert <COMMIT>
        * note this will create a revert commit

* reorder 2 joint commits
    $ git rebase -i and change the order of commits and save

* combine 2 joint commits
    $ git rebase -i and use s for squash, it will squash with the one before it

* set upstream
    $ git push -u origin <branch>

* run git command outside a repo folder
    $ git -C path/to/repo log

* amend the author of a commit
    $ git rebase -i SHA
        * change "pick" to "e" for the target commit
    $ git commit --amend --author="Author Name <email@addres.com>"
    $ git rebase --continue

* insert a commit between 2 consecutive commits
    * for example, we want to insert a commit B between commit A and C
    * git rebase -i A~1
    * change commit A's "pick" to "edit", and save & exit
    * create commit B by git commit
    * git rebase --continue

* add files to the last commit without changing the commit message
    $ git commit --amend --no-edit

* git send-mail
    $ git send-email --to="xxx" --cc="xxx" <COMMIT>
        * append -vN for version N

* step to authenticate by ssh key
    * generate ssh key paire
        $ ssh-keygen -t ed25519 -C "your_email@example.com"
    * copy pub key to github page
    * test ssh key
        $ ssh -T git@github.com
        $ git remote set-url origin git@github.com:username/your-repository.git
        $ git add -A
        $ git commit -m "xxx"
        $ git push
    * Add ssh key to ssh agent
        $ eval $(ssh-agent -s)
            * make sure ssh-agent is running
        $ ssh-add ~/.ssh/id_ed25519
