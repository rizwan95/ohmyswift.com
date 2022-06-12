---
layout: post
title: Experimenting with Swift async and await pattern using Xcode
date: 2020-12-25 21:02 +0530
category: Concurrency
tags: [swift async await, async/await swift, concurrency in swift, swift concurrency, async await, async await swift5]
comments: true
author: Rizwan
summary: You all might know that async/await is accepted and is available in the main snapshots! Let's get our hands dirty by trying out some basic example of async/await in Swift. 
image:
    path: assets/images/expermiment-async-await/async-await-facebook.jpeg
    twitter: assets/images/expermiment-async-await/async-await-twitter.jpeg
    facebook: assets/images/expermiment-async-await/async-await-facebook.jpeg


---
You all might know that async/await is accepted and is available in the main snapshots! Let's get our hands dirty by trying out some basic example of async/await in Swift. 

### Prerequisites
1. Xcode 12.3
2. Latest Swift Toolchain (You can download it from [here](https://link.ohmyswift.com/J3EvM)) 


### Installing the Swift Toolchain 
Download the Swift Toolchain, and install the .pkg file. After installing the Swift toolchain, open Xcode and go to Preferences -> Components and select ```Swift Development Snapshot```

![Swift Development Toolchain](/blog/assets/images/expermiment-async-await/swift-toolchain.png)


Next, go to your Project's build settings and add the following Swift flags ``` -Xfrontend -enable-experimental-concurrency ```

![Swift Compiler Flags](/blog/assets/images/expermiment-async-await/other-flags.png)

That's it! You have installed the latest Swift Development Toolchain in your Xcode. 

### Using completion handlers to handle asynchronous tasks
We usually use completion handlers for handling asynchronous tasks. For example,
{% highlight swift %}
private func getPlayerNames(completion: (() -> Void)? = nil) {
    DispatchQueue.global().async {
        self.playerNames = self.gamePlayers.map {
            return $0.name
        }
        completion?()
    }
}

internal func performCompletionHandlerCall() { 
	self.getPlayerNames {
        print("Printing names from a completion handler ", self.playerNames)
    }
}
{% endhighlight %}

The above code is OK, but there are too many things going on. It is error-prone, and the code starts falling apart when nesting of multiple completion handlers is required, which eventually leads to the pyramid of doom. Let's find out how to re-write the above code using the new async await approach.

### Replacing completion handlers with async/await

When you write async/await code, the boilerplate code is reduced, and it allows us to focus on improving the performance of the concurrent code. 

{% highlight swift %}

private func refreshPlayers() async {
    self.playerNames = await self.getNames()
}

private func getNames() async -> [String] {
    return self.gamePlayers.map{$0.name}
}

@asyncHandler internal func performAsyncAwaitOperation() {
    await self.refreshPlayers()
    print("Printing names from a async await function ", playerNames)
}
{% endhighlight %}

The above code is clean, precise, self explanatory, and less confusing. 
The usage of async and await keywords in the methods improve the readability of the code. 

### Closing Thoughts
The async/await pattern is a vast improvement. The real power of async/await will be revealed when multiple asynchronous operations are chained.  It is still in development, and many more improvements are made as we speak. I will be keeping an eye on how things shape, and I will be writing more articles about the async/await pattern.
If you are interested in learning more about the async/await pattern, I have given reference links at the end of the article. You can give it a read for a better understanding. 
Also, I have uploaded the demo project to github. You can download it from [here.](https://link.ohmyswift.com/43KZu)

### References

[1] <https://forums.swift.org/t/swift-concurrency-roadmap/41611>

[2] <https://forums.swift.org/t/question-about-async-await/6659/15>

[3] <https://forums.swift.org/t/concurrency-fixing-race-conditions-in-async-await-example/6514/45>

### Special mentions

Shoutout to [Karthikeyan](https://twitter.com/karthikgs7) for his help in setting up the toolchain and stuff.

### App Showcase

Winya - A ***free screen-sharing app*** that casts your screen to Twitch in HD. It will be useful for gamers to streaming their gameplay to Twitch.
Ohmyswifters, ***[download the app](https://winya.link/getwinya)*** and show your support to them.

***[iOS, and iPadOS download link](https://winya.link/getwinya)***

### About the author

- **Rizwan Ahmed** - iOS Engineer.  Twitter - <https://twitter.com/rizwanasifahmed>

#### More articles

- [Closure based actions in UIButton](/blog/2020/11/02/closure-based-actions-in-uibutton/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)
