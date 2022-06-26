---
layout: post
title: 'Exploring Deque in Swift Collections'
date: 2021-04-14 23:00 +0530
category: Deque
tags: [swift, swift ordered dictionary, swift collections, swift deque, swift deque collections, swift ordered set, swift arrays, deque vs arrays, swift deque vs swift arrays]
comments: true
author: Rizwan Ahmed A
summary: Deque (should be pronounced as "deck") is a collection implementing double-ended queues. Deques are similar to arrays, but they have efficient insertions and removal of elements at the beginning and at the end. Let's see a sample implementation of deque. 
image:
    path: assets/images/deque/Deque-fb.jpg
    twitter: assets/images/deque/Deque-twitter.jpg
    facebook: assets/images/deque/Deque-fb.jpg
---

Deque (should be pronounced as "deck") is a collection implementing double-ended queues. Deques are similar to arrays, but they have efficient insertions and removal of elements at the beginning and at the end. 

The indexing semantics are integer indices that are the same as arrays. 
Now let's see a sample implementation of deque. 

{% highlight swift %}
var colors: Deque = ["Yellow", "Orange"]
print(colors) // [Yellow, Orange]
{% endhighlight %}

The above code implements a deque of colors with the strings yellow and orange. 


## Deque operations

Now let's see some operations or methods unique to deques. 

### 1. prepend - Adding an element at the beginning of the deque.

{% highlight swift %}
colors.prepend("Blue") // Blue is added to the beginning
{% endhighlight %}

### 2.  append - Adding an element to the end of the deque. 

{% highlight swift %}
colors.append("White") // White is added to the end
{% endhighlight %}


### 3. popFirst - Removal of an element from the beginning of the deque.

{% highlight swift %}
let _ = colors.popFirst() // Blue is removed
{% endhighlight %}


### 4. popLast - Removal of an element from the beginning of the deque.

{% highlight swift %}
let _ = colors.popLast() // White is removed
print(colors) // [Yellow, Orange]
{% endhighlight %}

## Other operations

Addition to deque specific methods, there are some common methods like insert, sort, etc., 

{% highlight swift %}
colors.insert("Violet", at: 1) 
print(colors) // [Yellow, Violet, Orange]
colors.sort() 
print(colors) // [Orange, Violet, Yellow]
{% endhighlight %}


## Key highlights of a deque

- Deque implements value semantics.
- Deque conforms to RangeReplaceableCollection, MutableCollection, and RandomAccessCollection.
- Deque stores its elements in a circular buffer. So that insertions and deletions at the beginning and end are efficient. 


## The Gotchas

Every data structure has its pros and cons. Likewise, there are some gotchas of deque which we have to know. 

- The storage in a deque is discontiguous, whereas, in an array, it is contiguous. Because of this behavior, insertions in the front in a deque are faster, and in arrays, random-access lookups are faster.  So it is not recommended to replace all arrays with deques in the code. We need to know when to use arrays and when to use deques. 

## Closing thoughts 

Deque is an excellent addition to Swift. Likewise, Ordered Set and Ordered Dictionary are also included in Swift collections. I will be writing more about them in the upcoming articles. 
I hope you like this article. Do let me know your thoughts about the deque data structure in the comments below. 

{% include appshowcase-mini.html %}

### References

[1]  <https://swift.org/blog/swift-collections/>
[2]  <https://github.com/apple/swift-collections/blob/main/Documentation/Deque.md>

### About the author

- **Rizwan Ahmed** - iOS Engineer.  Twitter - <https://twitter.com/rizwanasifahmed>

#### More articles

- [Different methods to remove the last item from an array in Swift](/blog/2022/04/24/different-methods-to-remove-the-last-item-from-an-array-in-swift/)
- [Closure based actions in UIButton](/blog/2020/11/02/closure-based-actions-in-uibutton/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)

