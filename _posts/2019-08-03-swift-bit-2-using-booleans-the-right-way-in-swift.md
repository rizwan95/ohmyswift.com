---
layout: post
title: 'Swift bit #2 - Using Booleans the right way, in Swift'
date: 2019-08-03 09:19 +0530
categories: Swift fundamentals
tags: [swift, booleans]
author: Rizwan Ahmed A
---

Boolean is one of the most frequently used and simplest data type in any programming language.It is common to want to toggle the state of the boolean variable. So, we normally do it like this,


{% highlight swift %}

private var isEnabled = trueif isEnabled == true {
 isEnabled = false
}
print(isEnabled) // Prints false

{% endhighlight %}

The above approach is common but there will be cases where the boolean value should be toggled frequently. Explicitly assigning the boolean to true or false can be error prone. In Swift, we can use the toggle() method to toggle the value of a boolean.


{% highlight swift %}

private var isEnabled = true
if isEnabled == true{
 isEnabled.toggle()
}
print(isEnabled) // Prints false

{% endhighlight %}

{% include appshowcase-mini.html %}

Though it is simple, it will be very beneficial in cases which involves complex data structures like,

{% highlight swift %}
floatingView.panel.shouldScroll.toggle()
{% endhighlight %}

Playground sample,

![Toggle() method in Swift boolean](/blog/assets/images/swiftbit02.png)

Follow me on [Twitter](https://twitter.com/rizwanasifahmed). 
Have any queries? Feel free to DM me.

