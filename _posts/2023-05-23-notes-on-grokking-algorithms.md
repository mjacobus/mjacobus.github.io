---
layout: post
title: Notes on Grokking Algorithms
tags: [Books]
comments: true
---


## Chapter 2

### Linked lists

- Upside: are memory efficient (no need to reallocate the list if an element is added). 
- Downside: It is only (mostly?) good for iterating through all elements. If you need access to a random specific element, you need to run through all elements. Good for, I.E.: queues
- Reading: O(n)
- Inserting: O(1) - Insert in the middle just changes the reference
- Deleting: O(1)

### Arrays

- Downside: You need to either reserve space in memory or reallocate the array, as they need to find sequenced slots
- Upside: Finding the Nth element is easy, as they are stored sequentially in the database.
- Reading: O(1)
- Inserting: O(n) - Inserting in the middle requires shifting elements
- Deletion: O(n)

### Tradeoffs

Random access vs sequential access.

## Chapter 3: Recursion

- Recursion uses more memory because of the `call stack`, that saves variable information, but it may be easier to grasp than a for loop.
- For loop can be more efficient.
- It has the base case and the recursive case.

## Chapter 4: Quicksort

D&C (Divide and conquer works):

1. Figure out a simple case as the base case
2. Figure out how to reduce your problem and get to the base case

> TIP: When you're writing a recursive function involving an array, the base case is often an empty array or an array with one element. If you're stuck, try that first.

## Chapter 5: Hash Tables

- Hash -> index -> instant lookup

Good for:

1. Modeling relationships from one thing to another thing
2. Filtering out duplicates
3. Caching

Internals:

- Collisions are solved with linked lists at the Nth index
- Load factor % and distribution factor of the hash function will factor in
- When load factor is more than 0.7 it is time to resize the hash table (7 out of 10 used).

Big O

- Worst case it inserts/deletes as poorly as an array (O(n))
- Best case it inserts/deletes as well as a linked list (O(1))
- Worst case it reads as poorly as a linked list (O(n))
- Best case it reads as well as an array list (O(1))

## Chapter 6: Breadth-first Search
