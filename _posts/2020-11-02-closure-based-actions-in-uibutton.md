---
layout: post
title: Closure based actions in UIButton
date: 2020-11-02 00:54 +0530
category: UIButton
comments: true
tags: [swift, uibutton closure, closure, closure uibutton, callbacks closure, closure callbacks]
author: Rizwan Ahmed A
summary: iOS 14.0 brings us many improvements and new APIs. One such API is the closure based action API for UIControls. Let's see how to use it. 
image:
    path: assets/images/closurebasedactions/Closure-based-actions-facebook.png
    twitter: assets/images/closurebasedactions/Closure-based-actions-twitter.png
    facebook: assets/images/closurebasedactions/Closure-based-actions-facebook.png

---

iOS 14.0 brings us many improvements and new APIs using which the developers can write efficient code. One such API is the closure based action API instead of the ```addTarget``` method in UIControls. Yes, you heard me right—no more usage of ```addTarget``` methods, ```#selector()```, and ```@objc``` annotation in front of methods.
More importantly, we can write a closure based code using the action handler. Okay, enough talk, let's dive into the code.

### Target-based UIButton. (iOS 13.0 and earlier)

{% highlight swift %}
fileprivate func configureButton() {
    fileprivate func configureButton() {
    let button = UIButton(type: .custom)
    button.addTarget(self, action: #selector(openFile(_:)), for: .touchUpInside)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitle("Tap me", for: .normal)
    self.view.addSubview(button)
}

 @objc fileprivate func openFile(_ sender: UIButton) {
        print("File opened")
    }
}
{% endhighlight %}

### Closure based UIButton (iOS 14.0 and later)

#### Variant 1

{% highlight swift %}
fileprivate func configureButton() {
    let button = UIButton(type: .custom, primaryAction: UIAction(handler: { _ in
        print("File opened")
    }))
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitle("Tap me", for: .normal)
    self.view.addSubview(button)
}
{% endhighlight %}

#### Variant 2

{% highlight swift %}
fileprivate func configureButton() {
    let button = UIButton(type: .custom)
    self.view.addSubview(button)
    button.setTitleColor(.systemBlue, for: .normal)
    button.setTitle("Tap me", for: .normal)
    button.addAction(UIAction(handler: { _ in
        print("File opened")
    }), for: .touchUpInside)
}
{% endhighlight %}

As you can see, I have mentioned two variants of closure based UIButton.

In the first variant, the action handler is specified during the initialization of the button.
In the second variant, the action handler is specified after the initialization of the button.
It is up to the developer to choose whichever method they want. My personal preference is the second variant.

### Limitations

As I had mentioned earlier, the closure based actions are available for iOS 14.0 and above. If you want to support iOS 13.0 and earlier, you will still have to use the legacy ```addTarget``` method.

### Closing thoughts

It is good to see that Apple is working so hard to improve its SDKs. Let us try to adopt the new APIs as much as we can to make the development process easier and effective. It will be challenging to adapt to the change, but it is worth it. You will see more about these new APIs in the upcoming articles, and I will show you how to make the most out of them.

### App Showcase 

We always want to give back to the community. So we decided that we will review some of the most amazing apps which we had used.

#### App name - Winya (iOS and iPad OS app)

A ***free screen-sharing app*** that casts your screen to Twitch in HD. It will be useful for gamers to streaming their gameplay to Twitch.
Ohmyswifters, ***[download the app](https://winya.link/getwinya)*** and show your support to them.

***[iOS, and iPadOS download link](https://winya.link/getwinya)***

### About the author

- **Rizwan Ahmed** - iOS Engineer. Twitter - <https://twitter.com/rizwanasifahmed>


#### More articles

- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)
- [Why should we avoid using closures in Swift structs?](/blog/2020/01/11/why-should-we-avoid-using-closures-in-swift-structs/)
