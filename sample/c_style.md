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
