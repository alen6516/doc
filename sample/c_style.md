## comment in doxygen style
* [ref](https://flcwiki.desy.de/How%20to%20document%20your%20code%20using%20doxygen)

/**
  Commenting something...
*/


/** My function doing something...
    @param param1 first parameter
    @param param2 second parameter
    @return value return value
*/
float myFunction(float param1, float param2){
....
}


int var; /**< Detailed description after the member */

## comment
* always use /* */ for comment
* use // to hide some unwanted code
* use //TODO: for something that is not imeplemented
* use //FIXME: for something that is implemented but we want to improve
