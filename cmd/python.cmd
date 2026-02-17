
## venv
$ cd ~/my_project
$ python3 venv <name>
    * this create a directory structure like:
    ```
    my_project/
    ├── venv/
    │   ├── bin/
    │   ├── lib/
    │   └── pyvenv.cfg
    └── your_code.py
    ```
$ source venv/bin/activate
    * activate the virtual env

(venv) $ pip install -r requirements.txt
    * install packages from a requirements file

(venv) $ pip install requests
    * install packages in venv
(venv) $ pip list
    *  check installed packages
(venv) $ pip freeze > requirements.txt
    * freeze them to a requirements file
(venv) $ deactivate
    * deactivate venv
