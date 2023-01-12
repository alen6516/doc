# Data struct

## Stack
* First-in-last-out
* Can solve Tower of Hanoi problem (河內塔)
    * description: Given 3 rods (A, B, C) and a couple of disks which can slide onto any rods. At begining the disks are on rod A in order, now need to move them to rod C and every move should follow the rule that smaller disk can not be under the bigger one.

## Tree
* binary tree
    * type:
        * AVL tree
        * Binary search tree
        * Red-black tree

    * Binary search tree
        * left child's value <= father's value <= right child's value

    * AVL tree
        * first self-balance tree
        * A balancing factor is allocated for each node in the AVL tree, based on whether the tree is balanced or not.
            * the correct balance factor is 1, 0 and *1
        * If the tree has a new node, it will be rotated to ensure that it is balanced
        * Common operations such as viewing, insertion, and removal take O(log n) time

    * Traversal: Preorder, Inorder, Postorder, Level-order
        * Preorder: root node  => left child  => right child
        * Inorder : left child => root node   => right child
        * Postoder: left child => right child => root node
        * Level-order: just level-by-level and from top to ground

    * Search: Depth-first search, Breath-first search

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
* Merge Sort, Heap Sort, Quick Sort are efficient sort (avg time complexity O(n log n))

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
