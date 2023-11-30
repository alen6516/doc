# Description

# Overview

# Options
-z
    compress before transmitting

--delete
    by default rsync delete file in target side, add this parameter if needed

# Example
$ rsync -avh 10.98.34.139:~/ws/dmub_test/dmu_new .
    * remote and local both have folder called dmu_new
    * sync remote folder to local (local folder will be updated)
    * only new or changed files are updated
    * we can add --delete to update the deletion to the target side
