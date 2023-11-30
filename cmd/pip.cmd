# Description

# Overview
pip install vs apt install

* apt
  * apt is distro's package management tool
  * it will check package dependency on your OS, and deny installation if you are installing lib whose version is not compatible with your application
* pip install
  * python's package management tool
  * will not check if the package to be install affect your OS or other apps
  * so, use pip install under python virtual env

# Options

# Example
$ pip show <package>
    * show the version of a "installed" python package
    * if package is not installed by pip, no information is shown

$ sudo python3 -m pip install <package>
    * if no pip3 or somehow it is broken, use this command to install package
