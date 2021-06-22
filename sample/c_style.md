## comment in doxygen style
* [ref](https://flcwiki.desy.de/How%20to%20document%20your%20code%20using%20doxygen)
* [ref](https://www.cs.cmu.edu/~410/doc/doxygen.html)

/**
  Commenting something...
*/


/** My function doing something...
    @param in param1 first parameter
    @param out param2 second parameter
    @return value return value
*/
float myFunction(float param1, float param2){
....
}


/**
 * This function is used to parse MPLS headers and Pseudowire.
 * So far we support EoMPLS only.
 *
 * @param[in] eth           - the outter L2 header
 * @param[in] local_pkt_len - the total packet length
 * @param[out] sptr_ip      - return the correct starting address of L3 header
 * @return the number of MPLS header and pseudowire headers (include PWMCW and L2 headers)
 */

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

## code flow inside a large function
```
function {
{
	if (...) {
		goto result 1;
	} else if (...) {
		goto result 2;
	} else {
		goto result 3;
	}

result 1:
	...
	return;
result 2:
	...
	return;
result 3:
	...
	return;
}
```
