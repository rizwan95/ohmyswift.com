---
layout: post
title: An effective way to clear entire Userdefaults in Swift
date: 2020-05-19 19:49 +0530
category: Userdefaults
comments: true
tags: [swift, userdefaults]
author: Rizwan

summary: How will you clear all the values from UserDefaults effectively? Well, read the article to find out.
twitter_card:
   image: /blog/assets/images/clear-userdefaults.png

facebook:
    image: /blog/assets/images/clear-userdefaults.png

---
As a developer, we might use Userdefaults in our apps at some point in time for storing some basic configuration or settings in the app. But as the project gets complex, things can get pretty tough. Especially, when you want to clear all the UserDefaults values from the app. Well, we can use the ```removeObject``` method to remove the value for a particular key.

{% highlight swift %}UserDefaults.standard.removeObject(forKey: "is_app_launched"){% endhighlight %}

What if we have a vast number of keys, and we want to clear them all? Like 10 or 20 keys?  If we try to clear all the keys using the ```removeObject``` method, we might miss clearing some values, and the code becomes complex. We don't want to do that. So is there a better way? Yes, there is.

Apple provides us with a nice and clean API to deal with this. We can make use of the ```removePersistantDomainForName``` method to reset the UserDefaults.

{% highlight swift %}
if let bundleID = Bundle.main.bundleIdentifier {
    UserDefaults.standard.removePersistentDomain(forName: bundleID)
}
{% endhighlight %}

We can wrap the API in the UserDefaults extension to use it conveniently.

![Clear UserDefaults](/blog/assets/images/clear-userdefaults.png)

{% highlight swift %}
extension UserDefaults {
    static func resetDefaults() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}
{% endhighlight %}

Using the API clears our UserDefaults completely, and leaves it in a fresh state.
So yes, it might look insignificant, but it is a helpful API. Do you have other ways to clear the UserDefaults? Let me know in the comments below.  

### About the author

- **Rizwan Ahmed** - iOS Engineer. Twitter - <https://twitter.com/rizwanasifahmed>

### More articles

- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)
- [Why should we avoid using closures in Swift structs?](/blog/2020/01/11/why-should-we-avoid-using-closures-in-swift-structs/)
- [Using UICollectionViewCompositionalLayout in iOS 12 and earlier](/blog/2020/03/18/using-uicollectionviewcompositionallayout-in-ios-12-and-earlier/)