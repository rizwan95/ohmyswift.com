---
layout: post
title: Swap keys and values of a Dictionary
date: 2021-03-24 14:36 +0530
category: Dictionary
tags: [swift, swift dictionary, dictionary]
comments: true
author: Rizwan Ahmed A
summary: Dictionaries come with keys and values where the keys are unique. Sometimes, there might be a situation where we would want to swap the keys and values of a dictionary. Let's see how to do it.
image:
    path: assets/images/swap-keys-values/swap-keys-values/swap-keys-values-fb.jpg
    twitter: assets/images/swap-keys-values/swap-keys-values/swap-keys-values-twitter.jpg
    facebook: assets/images/swap-keys-values/swap-keys-values/swap-keys-values-fb.jpg

---

Dictionaries are one of the most commonly used data structures. Dictionaries come with keys and values where the keys are unique. Sometimes, there might be a situation where we would want to swap the keys and values of a dictionary. Let's see how to swap keys and values of a dictionary in swift.


While doing so, we need to make sure that the values which are converted to keys are hashable and unique, else the conversion will fail.
{% highlight swift %}
extension Dictionary where Value: Hashable {
    struct DuplicateValuesError: Error { }
    init?(swappingKeysAndValues dict: [Value:  Key]) {
        do {
            try self.init(dict.lazy.map { ($0.value, $0.key) },
                          uniquingKeysWith: { _,_ in throw DuplicateValuesError() })
        } catch {
            return nil
        }
    }
}

{% endhighlight %}

{% highlight swift %}
let dict = [1 : "A", 2 : "B", 3 : "C", 4 : "D", 5 : "E"]
if let swappedDict = Dictionary(swappingKeysAndValues: dict) {
    print(swappedDict)
}else{
    print("Unable to swap keys and values")
}
{% endhighlight %}
{% highlight swift %}
Result:
["A": 1, "D": 4, "C": 3, "E": 5, "B": 2]

{% endhighlight %}

The given code tries to swap keys and values of the given dictionary, and in case something goes wrong, it fails gracefully.

Do you know a better approach than the one mentioned in this article? Let me know in the comments.

### Credits and References

[1] <https://stackoverflow.com/a/50008875>

[2] <https://cocoacasts.com/what-is-a-lazymapcollection-in-swift>

### About the author

- **Rizwan Ahmed** - iOS Engineer.  Twitter - <https://twitter.com/rizwanasifahmed>


#### More articles

- [Closure based actions in UIButton](/blog/2020/11/02/closure-based-actions-in-uibutton/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)

{% include appshowcase-mini.html %}
