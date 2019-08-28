---
layout: post
title: 'Swift bit #4 - Swifty ways of typecasting objects'
date: 2019-08-27 08:33 +0530
category: Swift, iOS, Sign in with Apple
comments: true
---

Often we find ourselves in a situation where we need to check whether an object belongs to a particular class or not. For example, consider there is a UIView, and there are many subviews like UITextView, UILabel, and UIStepper. Now you have to find the UILabel from the parent view and change its text value. So how do we do that? 
Well, there are multiple ways of doing it. 

![Typecasting objects](/blog/assets/images/swiftbit04.png)


Method 1 - Using 'for' loop.
This method is a kind of brute force method. Usually, we all do this way. 

{% highlight swift %}

for subview in self.view.subviews{
    if subview is UILabel {
       // Change your text here
    }
}

{% endhighlight %}


We run the code, and everything works as expected. However, as a developer, we should find out more efficient methods of doing it. Let's see another way of doing it. 

Method 2 - Using 'case let' in 'for in' loop.
Here, we are using the power of the 'for in' loops to find the UILabel from the subviews.

{% highlight swift %}

for case let label as UILabel in self.view.subviews {
	//Change your text here
}

{% endhighlight %}


Neat, isn't it? There is a significant reduction in the number of lines of code. 

So, do we settle here? No. There should be more Swifty way to solve this problem. Let's see how.

Method 3 - Using 'compactMap'

In this method, we use 'compactMap'  to typecast a view to UILabel. I consider this method to be more swifty and descriptive. 

{% highlight swift %}
self.view.subviews
  .compactMap { $0 as UILabel }
  .forEach { 
	// Change your text here
 }
{% endhighlight %}


These are the methods I prefer to typecast objects from an array. There are many more methods too. So, what is your preferred way of typecasting objects? Tell us in the comments below. Still have any queries reach out to me directly on [Twitter](https://twitter.com/rizwanasifahmed)



