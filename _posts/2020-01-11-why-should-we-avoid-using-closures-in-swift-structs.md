---
layout: post
title: Why should we avoid using closures in Swift structs?
date: 2020-01-10 10:06 +0530
category: Closures
tags: [swift, struct, closures, struct vs classes]
comments: true
author: Rizwan
---

We all love closures, don't we? Closures make an iOS developer's life easy. Well, if it makes it easy, then why am I saying to avoid using closures in Swift structs? The reason is, "Memory leaks and unexpected behaviors."
Wait. What? Memory leak in structs? How could that be possible?

![Why should we avoid using closures in Swift structs?](/blog/assets/images/closuresinstructs.png)

Structs are value types, and there is no way a memory leak can occur.
Is that statement even true? We have so many questions already. So let's get back to the basics of memory management in Swift.

## **Back to basics**

The reason I am taking you back to the basics is that before diving into the main problem, we need to have a stronghold of the basics.

 The basic types in Swift fall into two categories. One is the "Reference type," and the other is the "Value type." Generally, Classes are reference types. On the other hand, structs and enums are value types.

## **Value types**

The value types store the data directly in memory. Every instance has a unique copy of the data. When a variable is assigned to an existing variable, the data is copied. The allocation of the value types is done in the stack. When the value type variable goes out of scope, the deallocation of the memory occurs.

```swift
struct Person {
    var name : String
}
var oldPerson = Person(name: "Rizwan")
var newPerson = oldPerson
newPerson.name = "Oh my Swift"
print(oldPerson.name)
print(newPerson.name)

-------
Output:
Rizwan
Oh my Swift
-------
```

We can see that changing the value of the newPerson doesn't change the value of oldPerson. This is how value types work.

## **Reference types**

The reference types keep a reference (aka a pointer) to the data when initialized. Whenever a variable is assigned to an existing reference type, the reference is shared among the variables. The allocation of reference types is done in the heap. The ARC (Automatic Reference Counting) handles the deallocation of the reference type variables.

```swift
class Person {
    var name: String
    init(withName name: String){
        self.name = name
    }
}
var oldPerson = Person(withName: "Rizwan")
var newPerson = oldPerson
newPerson.name = "Oh my Swift"
print(oldPerson.name)
print(newPerson.name)


------
Output
Oh my Swift
Oh my Swift
------
```

We can see that changing the oldPerson variable reflects the changes in the newPerson variable. This is how reference types work.

Usually, memory leaks occur in reference types. It occurs in the form of retain cycles in most of the cases. To know more about retain cycles, read this [blog](https://medium.com/flawless-app-stories/memory-leaks-in-swift-bfd5f95f3a74) from Flawless app stories.

So, if reference types are the reason for memory leaks, we can use value types for all purposes. That should solve the problem.

Unfortunately, this is not the case. Sometimes structs and enums can be treated as reference types, and this means that retain cycles can occur in structs and enums too.

## **Closures - The Villain in structs**

When you use closures in structs, the closure behaves as a reference type, and the problem starts there. The closures need to have a reference to the environment outside so that the environment can be modified when the closure body is executed.

In the case of classes, we can use `weak self` to break the retain cycle. When we try to do it for a struct, we get the following compiler error, 'weak' may only be applied to class and class-bound protocol types, not '{struct name}'

```swift
struct Car {
    var speed: Float = 0.0
    var increaseSpeed: (() -> ())?
}
var myCar = Car()
myCar.increaseSpeed = {
    myCar.speed += 30 // The retain cycle occurs here. We cannot use [weak myCar] as myCar is a value type.
}
myCar.increaseSpeed?()
print("My car's speed :")
print(myCar.speed) // Prints 30

var myNewCar = myCar
myNewCar.increaseSpeed?()
myNewCar.increaseSpeed?()
print("My new car's speed :")
print(myNewCar.speed) // Prints 30 still!
```

You would have expected the result of myNewCar to be 90.0, but it prints My new car's speed: 30.0

## **But why?**

Well, the reason is, "myNewCar" is a partial copy of "newCar." Since closures and their environments cannot be copied completely. The value of "speed" is copied, but the property "increaseSpeed" of "myNewCar" (myNewCar.increaseSpeed?()) holds a reference to the "increaseSpeed" of "myCar" with the "speed" of "myCar" in the captured environment. So, the "increaseSpeed" of "myCar" is invoked.

These are the various reasons why closures in Swift structs are dangerous.

## **So what do we do now?**

The straight forward solution is, avoid using closures in value types. If you want to use them, you should be very careful with it, or else it might lead to unexpected results.
Regarding the retain cycle, the only way to break them is to set the variables "myCar" and "myNewCar" to nil manually. It doesn't sound ideal, but there is no other way.

It was really thought provoking for me when I learnt about the behaviour of closures in value types. I hope you also felt the same.

 Enjoyed reading it? Feel free to share your comments below. Like this article? Share it with your friends!
 You can also follow me on twitter right here: <https://twitter.com/rizwanasifahmed>

## **References**

 [1] <https://forums.swift.org/t/avoiding-unbreakable-reference-cycle-with-value-types-and-closures/18757/6>

 [2] <https://github.com/Wolox/ios-style-guide/blob/master/rules/avoid-struct-closure-self.md>

 [3] <https://www.objc.io/issues/16-swift/swift-classes-vs-structs/>

 [4] <https://marcosantadev.com/capturing-values-swift-closures/>

### More articles

- [Using UICollectionViewCompositionalLayout in iOS 12 and earlier](/blog/2020/03/18/using-uicollectionviewcompositionallayout-in-ios-12-and-earlier/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)
- [Swift 5 replaces IntroSort with TimSort in the 'sort()' method](/blog/2019/09/29/swift-5-replaces-introsort-with-timsort-in-the-sort-method/)
