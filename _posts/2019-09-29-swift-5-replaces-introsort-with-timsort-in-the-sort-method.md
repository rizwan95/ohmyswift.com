---
layout: post
title: Swift 5 replaces IntroSort with TimSort in the 'sort()' method
date: 2019-09-29 11:04 +0530
category: Algorithms
tags: [swift, timsort, algorithms, sort]
comments: true
author: Rizwan
---

When we hear the term 'Sorting,' the algorithms which come to our mind are quicksort, insertion sort, merge sort, bubble sort, heap sort, and other sorting algorithms. We would have used the method `sort()` to sort elements in an array, in our day to day programming tasks. However, have you ever wondered what algorithm does the method uses to sort the items in Swift? Before Swift 5, it was 'Introsort,' but after Swift 5, it is 'Timsort.' Timsort is a sorting algorithm, used in programming languages like Python, and Java. I am going to cover mostly about 'Timsort' in this article. 

{% include appshowcase-mini.html %}


## What is 'Timsort?'
Timsort is a hybrid sorting algorithm similar to introsort. Hybrid sorting algorithms are the ones which combine two or more sorting techniques to achieve the required results. For example, introsort is a combination of insertion sort, quick sort, and heap sort whereas, Timsort is a beautiful combination of binary insertion sort and merge sort.

![Timsort in Swift](/blog/assets/images/timsortcomparisionchart.png)


## What is so special about Timsort? 
Timsort is a stable sorting algorithm, whereas Introsort is an unstable sorting algorithm. Stable sorting algorithms are those in which the repeated elements are maintained in the same order as given during the input. 

Unstable sorting algorithms are those in which the order of the repeated elements are not maintained in the same order as given during the input. 

![Stable and unstable sorting algorithms](https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Sorting_stability_playing_cards.svg/440px-Sorting_stability_playing_cards.svg.png)

Source - Wikipedia



## How does Timsort work?
I had already mentioned that Timsort uses a combination of binary insertion sort and merge sort. Timsort divides the array of elements into smaller sections and sorts them using binary insertion sort and merges the sorted arrays using merge sort. Isn't it cool? This technique is efficient when compared to introsort. Timsort has a worst case of O(n log n), and non-constant space complexity. 

## How does Timsort use insertion sort?
Timsort scans the array at first and performs a progressive sorting and merging of sub-arrays(sub-partitions), instead of dividing the entire array at first and merging them at the end. These partitions are known as "runs." Whenever a run is found, it is added to a stack containing all other previous runs.

My friend, Bruno Rocha tells that, Timsort takes advantage of the fact that in every array of elements, there are contiguous subsequences of already sorted elements. In such cases, Timsort keeps on advancing its pointer until the current sequence stops being an ascending or descending pattern to find its next run. 

**Step 1** - If the given sequence of elements is descending, we can quickly sort it in linear time by reversing the sequence.

**Step 2** - Timsort defines that every run should have a power of two, ranging from 16 to 256 or anything close to that. If the current run size is found to be smaller than the minimum field size, the elements are sorted immediately using insertion sort. 

## How does merge work in Timsort?
In general, Timsort's merging procedure is similar to mergesort. The algorithm tries to collapse the top three runs into a single one by merging them.  
Timsort makes use of the fact that if a specific array keeps on winning the comparison, then it is likely that it will win every time. In such cases, instead of comparing, we can apply binary search to reduce the comparisons. This technique is called as galloping. Swift doesn't use galloping, but it attempts to collapse runs based on the last four runs, instead of three. 

## Timsort algorithm benchmarks. 

During October 2018, Nate Cook submitted a PR for implementing Timsort in Swift. He stated, 

"This switches the standard library's sort algorithm from an in-place introsort to use a modified Timsort, a stable, adaptive sort that merges runs using a temporary buffer. This implementation performs straight merges instead of adopting Timsort's galloping strategy.
In addition to maintaining the relative order of equal/non-comparable elements, this algorithm outperforms the introsort on data with any intrinsic structure, such as runs of ascending or descending elements or a significant number of equality collisions. Benchmarking script and results can be seen in this gist: <https://gist.github.com/natecook1000/5161e10aeba09408c130284ea6ec4e11>"

The pull request went through many iterations, and finally, the Timsort pull request was merged in November 2018.  

## My thoughts about Swift
It is fantastic to see how Swift is evolving every moment. A lot has changed since Swift's initial release, and it is still changing. This kind of rapid evolution wouldn't have been possible without the contribution of our Swift community. 
 I realized that the more I learned, the more I understand that I know a very little. (Here is my [tweet](https://twitter.com/rizwanasifahmed/status/1176908418256211969?s=20) about it.)
 
 Enjoyed reading it? Feel free to share your comments below. Like this article? Share it with your friends!
 You can also follow me on twitter right here: <https://twitter.com/rizwanasifahmed>


## References:
If you want to learn more about Introsort , read this fantastic [blog](https://medium.com/swift2go/timsort-and-introsort-swifts-sorting-algorithms-f4b85b8fcbe2) written by my friend Bruno Rocha

Pull request Link: <https://github.com/apple/swift/pull/19717>

SwiftCI Benchmark results: <https://github.com/apple/swift/pull/19717#issuecomment-427511589>

Timsort: <https://svn.python.org/projects/python/trunk/Objects/listsort.txt>


### More articles

- [Using UICollectionViewCompositionalLayout in iOS 12 and earlier](/blog/2020/03/18/using-uicollectionviewcompositionallayout-in-ios-12-and-earlier/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)
- [Why should we avoid using closures in Swift structs?](/blog/2020/01/11/why-should-we-avoid-using-closures-in-swift-structs/)
