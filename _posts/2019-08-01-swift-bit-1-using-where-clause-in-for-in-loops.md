---
layout: post
title: 'Swift bit #1 — Using “where” clause in “for in” loops'
date: 2019-08-01 23:27 +0530
categories: Swift
---

We all would have written a piece of code similar to this,
The usual way,


{% highlight swift %}
let items = [1,2,3,4]
for item in items {
    if(item % 2 == 0){
        print(item)
    }
}
Result: 2 4 
{% endhighlight %}


As a Swift developer we always want to write better code. In Swift, we can use the “where” clause along with the for loop.
The Swift way,


{% highlight swift %}
for item in items where item % 2 == 0{
    print(item)
}
Result: 2 4
{% endhighlight %}

Neat isn’t it?
Playground sample,

![Playground sample](/blog/assets/images/swiftbit01.png)


Edit — Thanks to Md. Ibrahim Hassan for giving a better sample code.
Follow me on [Twitter](https://twitter.com/rizwanasifahmed)