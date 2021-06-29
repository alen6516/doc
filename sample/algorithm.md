## bloom filter

* for the input value, use 3 hash function to hash and get 3 result bit, mark the 3 bits on a bitarray

* if next time the input value comes again, we can check the bitmap and understand

* advantage
    * compare to array or hash table, bloom filter use less space

* disadvantage
    * false positive problem, when we find the 3 bits are on doesn't mean the value has come before

# Search

## hashtable vs self-balancing search tree

* There are kinds of data which cannot be hashed (or is too expensive to hash), therefore cannot be stored in hash tables.

* Trees keep data in the order you need (sorted), not insertion order. You can't (effectively) do that with hash table, even if you run a linked list through it.

* Trees have better worst-case performace

# Sort

* Selection Sort and Insertion Sort are simple sorts. They are usually used in small amount data sorting and have worse performance in larger amount of data.

## Selection Sort

* time complexity
    * best  O(n^2)
    * worst O(n^2)
    * avg   O(n^2)

* Space complexity: θ(1)

## Insertion Sort

* time complexity
    * best  O(1)
    * worst O(n^2)
    * avg   O(n^2)

* Space compexity: θ(1)

## Bubble Sort

* time
    * best  O(n)
    * worst O(n^2)
    * avg   O(n^2)
* Space: θ(1)

# Efficient Sort
* Merge Sort, Heap Sort, Quick Sort are efficient sort (avg time complexity O(n log n))
