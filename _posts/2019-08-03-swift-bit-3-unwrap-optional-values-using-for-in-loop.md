---
layout: post
title: 'Swift bit #3 — Unwrap optional values using for in loop'
date: 2019-08-03 09:29 +0530
category: Swift fundamentals
tags: [swift, for loops, for in loops, unwrap, optionals]
author: Rizwan Ahmed A
---

One of the most widely used features in Swift are the optionals. Optionals are types that can hold either a value or a nil value i.e nil.

Consider that there is an array of optional values. Usually, we use if let or guard statement to unwrap the optionals.


{% highlight swift %}

//An array of optionals.
    let cars = ["Ford","Lamborghini",nil,"McLaren","Aston Martin",nil]
    for car in cars {  
        if let carObject = car{   
             print(carObject)  
         }
    }
{% endhighlight %}

{% include appshowcase-mini.html %}

The above code is okay, nothing wrong with it, but we should try to use the power of Swift whenever we can.

We can unwrap the array of optionals using case let directly in the for in loop.

Here is how you do it,

{% highlight swift %}

//An array of optionals.
    let cars = ["Ford","Lamborghini",nil,"McLaren","Aston Martin",nil]

    for case let car? in cars {  
        print(car)
    }
{% endhighlight %}

Neat isn’t it? The number of lines of code is reduced, and the code looks more readable.

![Unwrapping optionals using for in loops](/blog/assets/images/swiftbit03.png)


Note — There are also other techniques like using compactMap to unwrap optionals, I will be covering about them in upcoming articles.
Follow me on [Twitter](https://twitter.com/rizwanasifahmed).
Have any queries? Feel free to DM me.
