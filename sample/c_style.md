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

## for a header file
* structrue
	* prologue: including the Author, Version, Reference
	* include file: system include file(stdio.h), user include file (with its reason)
	* definition and typedef: constant macro, functional macro, typedef and enum
	* data declaration: extern, non-static global, static global
	* function: function1 and its related functions, function2 and its related functions

* Header files that declare functions or external variables should be included in the file that defines the function or variable.
* it's not a good idea to define a variable in a header file
* README file is used to record whole status of the project, like each compile flag and its meaning, other doc
* comment
  	* comment a code block rather than comment a line of code
