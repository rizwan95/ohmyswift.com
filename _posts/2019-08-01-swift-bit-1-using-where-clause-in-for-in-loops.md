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

