---
layout: post
title: Different methods to remove the last item from an array in Swift
date: 2022-04-24 23:57 +0530
category: Array
tags: [swift, UIButton, iOS15, remove array elements, iOS 16, swift ios 15, droplast in swift, removeLast in swift, how to remove element from an array]
comments: true
author: Rizwan
summary: One of the widely used array manipulation methods is removing the last element from an array. The three valuable methods to remove an element from an array are dropLast(), popLast(), and removeLast(). Let's see what the difference between these methods and which one is effective.

---

Arrays are one of the most widely used data structures in Swift, and we deal with a lot of array manipulations. One such manipulation is the removal of the last element from an array. The three useful methods to remove an element from an array are dropLast(), popLast(), and removeLast()

  **_Let us give back to the community. Before getting started, show your support to indie devs by downloading their apps from the banner displayed below. It will help them build great apps._**
{% include appshowcase-mini.html %}

## dropLast()

We have an array of fruits, namely, ["Apple","Orange","Banana"]. Using the dropLast() method on the array will remove the last element ('Banana' in our case), and it will return the remaining array elements. dropLast() is the preferred method to remove an array because it is safe as it does not mutate the original array. 

{% highlight swift %}
let fruits = ["Apple","Orange","Banana"]
let nonRoundFruits = fruits.dropLast()
print(nonRoundFruits) // ["Apple", "Orange"]
{% endhighlight %}

## removeLast()
The next method is the removeLast() method. Unlike the dropLast() method, removeLast() method removes the last element from the original array and modifies it.

{% highlight swift %}
var fruits = ["Apple","Orange","Banana"]
let removedFruit = fruits.removeLast()
print(fruits) // ["Apple", "Orange"]
print(removedFruit) // Banana
{% endhighlight %}

There are two essential things to note here. 
The fruits array is mutable and hence it is declared as a 'var'
If there are no elements in the array and if removeLast() method is invoked, the app will crash.

## popLast()

The popLast() method is similar to the removeLast() method, but it has only one difference. When there are no elements in an array, and if the popLast() method is invoked, the app will not crash. Instead, it will return a nil value.

{% highlight swift %}
var fruits = ["Apple","Orange","Banana"]
let removedFruit = fruits.popLast()
print(fruits) // ["Apple", "Orange"]
print(removedFruit) // Optional("Banana")
{% endhighlight %}


### References

[1] <https://developer.apple.com/documentation/swift/array/1689751-droplast>

[2] <https://developer.apple.com/documentation/swift/array/2885764-removelast>

[3] <https://developer.apple.com/documentation/swift/array/1539777-poplast>



### About the author

- **Rizwan Ahmed** - iOS Engineer.  Twitter - <https://twitter.com/rizwanasifahmed>

### More articles

- [Exploring Deque in Swift Collections](/blog/2021/04/14/exploring-deque-in-swift-collections/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)
