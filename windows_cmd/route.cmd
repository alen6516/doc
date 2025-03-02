# Description

# Overview

# Options

# Example
> route PRINT
> route PRINT -4
> route PRINT -6
> route PRINT 157*          .... Only prints those matching 157*

> route ADD 157.0.0.0 MASK 255.0.0.0  157.55.80.1 METRIC 3 IF 2
         destination^      ^mask      ^gateway     metric^    ^
                                                     Interface^
  If IF is not given, it tries to find the best interface for a given
  gateway.

> route ADD 3ffe::/32 3ffe::1

> route CHANGE 157.0.0.0 MASK 255.0.0.0 157.55.80.5 METRIC 2 IF 2

  CHANGE is used to modify gateway and/or metric only.

> route DELETE 157.0.0.0
> route DELETE 3ffe::/32
