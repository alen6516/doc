# Description

# Overview

* follow tcl's grammar
* note for each send, need to be followed by an expect

# Options

    
# Example
* use as exp file
	* $ expect file.exp 192.168.1.1
```
# file.exp
#!/usr/bin/expect
set TARGET    [ lindex $argv 0]

spawn ssh admin@$TARGET
    expect  "login:"
    send    "alen\r"
    expect  "Password:"
    send    "1234\r"
    expect  "alen@linux*#"

    send    "conf\r"

	# match different output
    expect  {
        "multi-config feature?(yes/no)" {send "yes\r"}
        "*(config)*" {send "\r"}
    }

	# for loop
	for {set i 1} {$i <= $ZONE_NUM } {incr i 1} {
        send    "echo $i\r"
        expect  "$i"
	}

	
	# continue to send exit util exit the system
    expect {
        "alen@linux*" {
            send "exit\r"
            exp_continue
        }
        "*(N/Y)?:" {
            send "Y"
        }
    }
    expect eof
```
