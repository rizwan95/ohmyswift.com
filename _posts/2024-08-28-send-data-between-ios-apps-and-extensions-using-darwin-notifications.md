---
layout: post
title: Send data Between iOS Apps and Extensions Using Darwin Notifications
date: 2024-08-28 00:13 +0530
category: notifications
tags: [swift, xcode, xcode16, darwin notifications,CFNotificationCenter]
keywords: swift,xcode,darwin notifications,notifications,send data between app and extension,CFNotificationCenterGetDarwinNotifyCenter,CFNotificationCenterAddObserver,DarwinNotificationManager,CFNotificationCenter
comments: true
author: Rizwan Ahmed A
summary: Have you ever thought about how to pass data between the main app and its extension? Darwin notifications provide a powerful solution for this scenario. 

image:
    path: assets/images/darwin/facebook.png
    twitter: assets/images/darwin/twitter.png
    facebook: assets/images/darwin/facebook.png
---

In iOS development, app extensions run in separate processes from their containing apps. This separation poses a challenge when you need to communicate between the main app and its extensions. While `NSNotificationCenter` is a common choice for passing data between view controllers within the same app, it falls short when it comes to inter-process communication. Have you ever thought about how to pass data between the main app and its extension? Darwin notifications provide a powerful solution for this scenario. In this post, we'll explore how to implement a Darwin Notifications manager and use it to facilitate real-time data transfer between a main app and its extension.

## What are Darwin Notifications a.k.a CFNotificationCenterGetDarwinNotifyCenter? 

`CFNotificationCenterGetDarwinNotifyCenter` is a function in Apple's Core Foundation framework that provides access to the Darwin Notification Center. This notification center is designed for system-wide notifications, allowing different processes (such as your app and its extensions) to communicate with each other.

## How Does it Work?

**System-Wide Communication:** Unlike NSNotificationCenter, which is limited to the app's process, the Darwin Notification Center can send notifications that can be observed by other processes on the device. This makes it ideal for app-to-extension communication.

**No UserInfo Dictionary:** One limitation is that Darwin notifications do not support sending additional data (like a userInfo dictionary). This means you can only send a simple notification without any extra information. This is because the underlying mechanism, notify_post(), only accepts a string identifier for the notification

## A use case for Darwin Notifications

For example, when a broadcast upload extension starts or stops, you can use a Darwin notification to inform the main app. I have seen most of the people use UserDefaults or the Keychain but I personally feel that Darwin notifications are the best fit for this use case. 

## Implementing the Darwin Notification Manager

To start, we'll create a `DarwinNotificationManager` class that uses the `CFNotificationCenter` API to post and observe notifications across processes.

{% highlight swift %}
import Foundation

class DarwinNotificationManager {
    
    static let shared = DarwinNotificationManager()
    
    private init() {}
    
    // 1
    private var callbacks: [String: () -> Void] = [:]
    
    // Method to post a Darwin notification
    func postNotification(name: String) {
        let notificationCenter = CFNotificationCenterGetDarwinNotifyCenter()
        CFNotificationCenterPostNotification(notificationCenter, CFNotificationName(name as CFString), nil, nil, true)
    }
    
    // 2
    func startObserving(name: String, callback: @escaping () -> Void) {
        callbacks[name] = callback
        
        let notificationCenter = CFNotificationCenterGetDarwinNotifyCenter()
        
        CFNotificationCenterAddObserver(notificationCenter,
                                        Unmanaged.passUnretained(self).toOpaque(),
                                        DarwinNotificationManager.notificationCallback,
                                        name as CFString,
                                        nil,
                                        .deliverImmediately)
    }
    
    // 3
    func stopObserving(name: String) {
        let notificationCenter = CFNotificationCenterGetDarwinNotifyCenter()
        CFNotificationCenterRemoveObserver(notificationCenter, Unmanaged.passUnretained(self).toOpaque(), CFNotificationName(name as CFString), nil)
        callbacks.removeValue(forKey: name)
    }
    
    // 4
    private static let notificationCallback: CFNotificationCallback = { center, observer, name, _, _ in
        guard let observer = observer else { return }
        let manager = Unmanaged<DarwinNotificationManager>.fromOpaque(observer).takeUnretainedValue()
        
        if let name = name?.rawValue as String?, let callback = manager.callbacks[name] {
            callback()
        }
    }
}
{% endhighlight %}

## The breakdown of Darwin Notification Manager

{% highlight swift %}
private var callbacks: [String: () -> Void] = [:]
{% endhighlight %}

The `callbacks` stores callbacks for each notification name to execute when the notification is received.

{% highlight swift %}
func startObserving(name: String, callback: @escaping () -> Void) {
    callbacks[name] = callback
    
    let notificationCenter = CFNotificationCenterGetDarwinNotifyCenter()
    
    CFNotificationCenterAddObserver(notificationCenter,
                                    Unmanaged.passUnretained(self).toOpaque(),
                                    DarwinNotificationManager.notificationCallback,
                                    name as CFString,
                                    nil,
                                    .deliverImmediately)
}
{% endhighlight %}

The `startObserving` method registers a callback for a notification and adds an observer to listen for it. Call this method when you want to start observing for notifications. It is usually called when the view is initialized. 


{% highlight swift %}
func stopObserving(name: String) {
    let notificationCenter = CFNotificationCenterGetDarwinNotifyCenter()
    CFNotificationCenterRemoveObserver(notificationCenter, Unmanaged.passUnretained(self).toOpaque(), CFNotificationName(name as CFString), nil)
    callbacks.removeValue(forKey: name)
}
{% endhighlight %}


The `stopObserving` method removes the observer for a notification and deletes its callback to stop listening.It is usually called when the view gets deallocated. 


{% highlight swift %}
private static let notificationCallback: CFNotificationCallback = { center, observer, name, _, _ in
    guard let observer = observer else { return }
    let manager = Unmanaged<DarwinNotificationManager>.fromOpaque(observer).takeUnretainedValue()
    
    if let name = name?.rawValue as String?, let callback = manager.callbacks[name] {
        callback()
    }
}
{% endhighlight %}

The `notificationCallback` executes the stored callback when the corresponding notification is received.

## Using the Manager in a Broadcast Extension

{% highlight swift %}
import ReplayKit

class SampleHandler: RPBroadcastSampleHandler {
    
    override func broadcastStarted(withSetupInfo setupInfo: [String : NSObject]?) {
        DarwinNotificationManager.shared.postNotification(name: "com.yourapp.BroadcastStarted")
    }
    
    override func broadcastFinished() {
        DarwinNotificationManager.shared.postNotification(name: "com.yourapp.BroadcastStopped")
    }
}

{% endhighlight %}

## Observing the Darwin Notifications in a UIKit View

{% highlight swift %}

class DashboardViewController: UIViewController { 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.configureCallbacks()
    }


    fileprivate func configureCallbacks() {
        DarwinNotificationManager.shared.startObserving(name: "com.yourapp.BroadcastStarted") {
            print("*******Broadcast has started*******")
            // Handle the event when broadcast starts
        }
        
        DarwinNotificationManager.shared.startObserving(name: "com.yourapp.BroadcastStopped") {
            print("*******Broadcast has stopped*******")
            // Handle the event when broadcast starts
        }

    }
}
{% endhighlight %}

## Observing the Darwin Notifications in a SwiftUI View


{% highlight swift %}
import SwiftUI
import Foundation

struct BroadcastView: View {
    @State private var broadcastStatus: String = "Not Broadcasting"
    
    var body: some View {
        VStack {
            Text(broadcastStatus)
                .font(.largeTitle)
                .padding()
        
        }
        .onAppear {
            configureCallbacks()
        }
        .onDisappear {
            stopCallbacks()
        }
    }
    
    private func configureCallbacks() {
        DarwinNotificationManager.shared.startObserving(name: "com.yourapp.BroadcastStarted") {
            broadcastStatus = "Broadcasting..."
            print("*******Broadcast has started*******")
        }
        
        DarwinNotificationManager.shared.startObserving(name: "com.yourapp.BroadcastStopped") {
            broadcastStatus = "Not Broadcasting"
            print("*******Broadcast has stopped*******")
        }
    }
    
    private func stopCallbacks() {
        DarwinNotificationManager.shared.stopObserving(name: "com.yourapp.BroadcastStarted")
        DarwinNotificationManager.shared.stopObserving(name: "com.yourapp.BroadcastStopped")
    }
}
{% endhighlight %}

Like I had mentioned earlier, the observation is started in onAppear and the observation is stopped in onDisappear. This will make sure that your code doesn't cause a memory leak. 

## Key Takeaways

1. **Inter-Process Communication**: Darwin notifications provide a powerful mechanism for communication between different processes, such as between a main app and its extensions, overcoming the limitations of `NSNotificationCenter`.

2. **System-Wide Reach**: Unlike `NSNotificationCenter`, which is confined to a single app, Darwin notifications can be observed by any process on the device, making them ideal for app-extension communication.

3. **No Payload Support**: Darwin notifications do not support sending additional data (like a `userInfo` dictionary). They are limited to notifying observers of the occurrence of an event without additional context.

4. **Efficient Notification Handling**: By using `CFNotificationCenterGetDarwinNotifyCenter`, developers can efficiently post and observe notifications without the overhead of managing additional data.

5. **SwiftUI Integration**: Darwin notifications can be easily integrated into SwiftUI applications, allowing for real-time updates and state management across different app components.

## Closing thoughts

My mind always compares these inter-process notifications to comets passing through our planet Earth. Just as comets are rare and awe-inspiring events that capture our attention, Darwin notifications serve as crucial signals that allow different parts of an app ecosystem to communicate seamlessly. Isn't it a great analogy?

So, that is it. If you have read the blog till here, I really appreciate it. I hope this exploration of Darwin notifications has inspired you to think about inter-process communication in new ways. I can't wait to see how you use Darwin notifications in your apps. Do let me know your thoughts and experiences in the comments below. Your feedback and ideas are always welcome! Also don't forget to share this article with your network!

## References to Darwin Notifications

- [CFNotificationCenter Reference](https://developer.apple.com/documentation/corefoundation/cfnotificationcenter)

### About the author

- **Rizwan Ahmed** - Senior iOS Engineer. 
<br> LinkedIn - <https://www.linkedin.com/in/rizwan95/>
<br> Twitter - <https://twitter.com/rizwanasifahmed>

### More articles

- [SwiftUI in 2024: Bridging Perception and Reality](/blog/2024/08/15/swiftui-in-2024-bridging-perception-and-reality/)
- [From viewWillAppear to viewIsAppearing - Perfecting Your iOS View Transitions](/blog/2023/12/01/from-viewwillappear-to-viewisappearing-perfecting-your-ios-view-transitions/)
- [Exploring the New Push Notifications Console from Apple](/blog/2023/06/19/exploring-the-new-push-notifications-console-from-apple/)
- [How to send Remote Push Notifications to an iOS Simulator with Xcode 14](/blog/2023/05/28/testing-remote-push-notifications-in-ios-simulator-with-xcode-14/)
- [How to Instantly Track a Variable's Value Changes with Xcode Watchpoints](/blog/2023/05/26/how-to-instantly-track-a-variable-s-value-changes-with-xcode-watchpoints/)
- [Implementing a custom native calendar using UICalendarView in iOS16 and Swift](/blog/2022/06/12/implementing-a-custom-native-calendar-using-uicalendarview-in-ios16-and-swift/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
