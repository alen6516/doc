# Description
* split a large file into small files

# Overview
* usage: $ split [-bl] file PREFIX_OF_THE_RESULT_FILE_NAME


# Options
-l LINE_NUMBER
    specify how many lines in a splited file

-b SIZE
    specify the size of a splited file, can add b, k, m as the unit

# Example
$ split -b 300k /etc/services services_
    * the result filename will be services_aa, services_ab, services_ac,
