# Description

# Overview

# Options

# Example
$ pipenv install
    * install all packages in Pipfile
    * if Pipfile is not present, create Pipefile and Pipefile.lock to store the packages installed in the virtaul env

$ pipenv install requests
    * use pipenv install requests, and record it in Pipefile

$ pipenv uninstall requests

$ pipenv install --three
$ pipenv install --python 3.6.5
    * using python3 in virtual env

$ pipenv shell
    * enter virtual env

$ pipenv lock --requirements > requirements.txt
    * export requirements.txt

$ pipenv --upgrade
    * upgrade pipenv & pip
