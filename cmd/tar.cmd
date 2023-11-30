# Description

# Overview

# Options

    
# Example
$ tar xf archive.tar.xz
$ tar xf archive.tar.gz
$ tar xf archive.tar
    * Ubuntu includes GNU tar, which recoginizes the format by itself. One command works with any supported compression method!

* tar & untar
	* tar cvf folder.tar folder
	* tar xvf folder.tar

* Compress & Uncompress
    * gzip
        $ tar zcvf folder.tgz folder
        $ tar zxvf folder.tgz

    * tar.xz
        $ tar Jcvf folder.tar.xz folder
        $ tar Jxvf folder.tar.xz

    * bz2, .bz, .tar.bz2, .tbz2
        $ bzip2 -z folder
        $ bzip2 -dkv folder.bz2

    * rar
        $ rar a archive.rar myfolder
        $ rar x archieve.rar output/

    * zip
        $ zip -r myfolder.zip folder/
        $ unzip myfolder.zip

* Compress and send data without creating zip
   $ tar zcvf -  MyBackups | ssh user@server "cat > /path/to/backup/foo.tgz"
