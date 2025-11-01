# Functional Programming Extensions for C3

This project brings functional programming capabilities to the C3 language
 using generics (templates).
It extends C3 slices of any type (Type[]) with functional-style operations such as map, filter, for_each, contains, find, and reverse — all written in pure C3.

## Overview

C3 slices can now behave like functional collections thanks to the generic list module.
By defining operations directly on slices, you can apply expressive, composable transformations without losing the low-level control that C3 offers.

### Example operations include:

- [x] for_each(fn) – Apply a function to each element (in place)
- [x] map(fn) – Create a new transformed list
- [x] filter(fn) – Keep elements that satisfy a predicate
- [x] contains(fn) – Check if any element matches a predicate
- [x] find(fn) – Return the index of the first matching element
- [x] reverse() – Reverse the array in place
- [ ] count(fn) – Count how many elements satisfy a predicate
- [ ] chain(fn) – Chain transformations or combine slices
- [ ] sort(fn) – Sort the slice using a custom comparison function

## Usage

~~~ c
// import the module
import list;

// implement the functional paradigm to the slices
alias FunctionalIntSlice = list::Type {int};

// use it
int[] list = {1, 2, 3, 4};

// iterate
list
    .for_each(fn(x) => x * 2)
    .for_each(fn(x) => x * 4)
    .printn();
// [8, 16, 24, 32]

// check for condition
io::printn(list.contains(fn(i) => i < 10));
// true

// clone lists
int[] new_list = list
        .map(fn(x) => x * 2, tmem) // temporal allocator
        .for_each(fn(x) => x * 4);


// create a new filtered list
int[] list_filtered = list
        .filter(fn(num) => num > 23, tmem);
list_filtered.printn();
// [24, 32]
~~~