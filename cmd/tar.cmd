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
    * tgz or tar.gz
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

    * xz
        $ unxz file.xz

    * gz
        $ gzip -d file.gz

    * pkg.tar.zst
        $ tar -xvf file.pkg.tar.zst

* select files/folders and add to tar
    $ tar -cvf my.tar file1 folder2/

* add files/folders to an existing tar archive
    $ tar -f my.tar --append file2 folder2

* update files to an existing tar archive
    $ tar -uf my.tar my/newfile

* check tar file contents without extracting it
    $ tar -tf my.tar

* Send data in folder without creating tar file
    $ tar cvf - MyDir | ssh user@server "cat > path/to/backup/foo.tar"

* Compress and send data without creating zip
   $ tar zcvf - MyDir | ssh user@server "cat > /path/to/backup/foo.tgz"

* Update a tar.gz file
    $ tar -cvf my.tar some-dir
        * create a tar file first
    * update/add some files in some-dir
    $ tar -uvf my.tar some-dir
    $ gzip my.tar

$ tar --extract --file firmware_bin.tar --directory ./ --exclude='*_unsigned' --strip-components 1
    * --exclude='*_unsigned'
        * skip all *_unsigned files

    * --strip-components 1
        * Removes the first level of directory hierarchy from the extracted files
        * folder/file will be extracted as file

* best practice to compress source code
    $ tar -I 'zstd -T0 -19' -cf chromium-src.tar.zst chromium/
        * -T0: use all CPU core
        * -19: good for source code compression and decompression
        * after decompression, simply update by:
            $ git status
            $ git pull
            $ gclient sync
