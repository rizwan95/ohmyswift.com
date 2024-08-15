---
layout: post
title: 'SwiftUI in 2024: Bridging Perception and Reality'
date: 2024-08-16 00:12 +0530
category: WWDC24
tags: [swift, xcode, xcode16, ios simulator, apple silicon, wwdc24, ios18, swiftui]
keywords: swift, xcode, xcode16, ios simulator, apple silicon, wwdc24, ios18, swiftui, tca, button
comments: true
author: Rizwan Ahmed A
summary: SwiftUI in 2024 - Bridging Perception and Reality

image:
    path: https://ik.imagekit.io/ogr1ppev3u/OhMySwift/SwiftUI-Bridging-The-Gap/tr:w-1200,h-630/swiftui-button-behaviour_pxP875YCOu.svg?updatedAt=1723749347255
    twitter: https://ik.imagekit.io/ogr1ppev3u/OhMySwift/SwiftUI-Bridging-The-Gap/tr:w-600,h-330/swiftui-button-behaviour_pxP875YCOu.svg?updatedAt=1723749347255
    facebook: https://ik.imagekit.io/ogr1ppev3u/OhMySwift/SwiftUI-Bridging-The-Gap/tr:w-300,h-300/swiftui-button-behaviour_pxP875YCOu.svg?updatedAt=1723749347255
---

I recently spoke at [iOSKetchup2024 hosted by Zomato x Blinkit](https://www.linkedin.com/posts/rizwan95_iosketchup2024-swiftui-swift-activity-7228315754343849984-9V2f) about the challenges and opportunities of using SwiftUI. The audience seemed to enjoy the session as much as I did! Here, I’m excited to share my experience and provide a detailed write-up of my talk.

## Challenges with SwiftUI

SwiftUI can be challenging, especially when dealing with:

1. **Convincing Management**: It's crucial to ensure that the modules we implement in SwiftUI are backward compatible. If the project's codebase is old, this can be particularly challenging.

2. **Uncertainty**: This is perhaps the biggest challenge. We usually follow a three-step approach:
   - Conduct necessary research before diving in.
   - Start small and keep changes minimal.
   - Be ready to revert changes if you feel stuck.

## Understanding SwiftUI

What exactly is SwiftUI? Let me explain with a coffee machine analogy. 

{% include image.html src="https://ik.imagekit.io/ogr1ppev3u/OhMySwift/SwiftUI-Bridging-The-Gap/coffee-analogy_VgbjnzEsj.svg?updatedAt=1723748277901" alt="SwiftUI coffee machine analogy" %}

Imagine a general coffee machine and an industrial coffee machine. Both brew coffee, but the industrial machine offers more customization. Similarly, SwiftUI is a powerful framework that helps you build quick prototypes and advanced applications.

## The State of SwiftUI

Is SwiftUI declarative or imperative? Most people think it is declarative, but it's actually both! Consider the below code snippet.

{% include image.html src="https://ik.imagekit.io/ogr1ppev3u/OhMySwift/SwiftUI-Bridging-The-Gap/declarative-imperative_q3uIyzpVl.png?updatedAt=1723749686484" alt="SwiftUI is both declarative and imperative" %}

The line `Button("Add friend")`  is declarative, and the next line `friend.append("Adithya")` is imperative. With SwiftUI, getting started should be easy, and delving deeper should be possible. Check this [video from Apple](https://developer.apple.com/videos/play/wwdc2024/10150/) for more information. 


## SwiftUI's Behavior Across Platforms

SwiftUI's behavior can vary from platform to platform. The same code might behave differently. For example, a button's code renders differently across platforms. In iOS, we say "Tap the button," in macOS, "Click the button," and in visionOS, "Hold the button." Many mistakenly believe SwiftUI is "Write once, run everywhere." It is actually "Learn once, apply anywhere." Remember this principle. Check this [video from Apple](https://developer.apple.com/videos/play/wwdc2024/10150/) for more information. 

{% include image.html src="https://ik.imagekit.io/ogr1ppev3u/OhMySwift/SwiftUI-Bridging-The-Gap/swiftui-button-behaviour_pxP875YCOu.svg?updatedAt=1723749347255" alt="SwiftUI's Behavior Across Platforms" %}

## Navigating in SwiftUI

When we started with SwiftUI, navigating between views was challenging. We understand that SwiftUI is evolving, but it can be frustrating when things don't work properly. I decided to ask the Reddit community about their experiences with SwiftUI. Surprisingly, the thread received many responses, and it seemed everyone was in the same boat. Many people suggested various options, but only two were feasible:

1. Use SwiftUI views wrapped in `UINavigationController`.
2. Use TCA (The Composable Architecture).

We were hesitant to use TCA, questioning whether a framework was necessary just for navigation. However, we decided to try it, and it solved all our issues. It's brilliantly written, follows the Redux pattern, and provides a nice separation of concerns in the code. It also solved our problem of backward compatibility! There are some cons, though. You'll need to unlearn and relearn concepts, and TCA need not be applied to every SwiftUI view. If you're ready to begin, here are [some great tutorials](https://pointfreeco.github.io/swift-composable-architecture/main/tutorials/meetcomposablearchitecture/) to help you get started.

## Accessibility in SwiftUI

SwiftUI offers many built-in features for accessibility. I believe SwiftUI will make it easier for developers. Have you ever considered teaching SwiftUI to your designer? How about using SwiftUI as a design tool? SwiftUI can indeed be used to craft design tools! The problem with existing design tools is that the designs are static, lacking the nuances of UX on the device. We started simple by creating a SwiftUI watchOS app. This experience revealed features we hadn't considered, like the digital crown and scroll sensitivity. Designing in SwiftUI opened up new possibilities, making designs dynamic.

## Designing with SwiftUI

The idea of designing with SwiftUI might seem unconventional. How can a designer learn SwiftUI? Surprisingly, it solves many problems. Traditional design tools are static and lack insights into hardware behavior. Designing in SwiftUI provides a deeper understanding of the platform. Apple even released a [WWDC video](https://developer.apple.com/videos/play/wwdc2023/10115/) on this topic.

## Key Takeaways

1. Start converting your UIKit views into SwiftUI, especially `UITableViewCells`. You can use `UIHostingConfiguration` to embed SwiftUI cells inside UIKit.
2. Use TCA. It may be tough initially, but you'll get used to it.
3. While developing for one platform, consider how it will behave on other platforms.
4. Try using SwiftUI to design and prototype your product.

## Conclusion

SwiftUI is a transformative framework that bridges the gap between perception and reality in app development. While it presents its own set of challenges, the potential it offers for creating dynamic, cross-platform applications is immense. By embracing strategies like TCA and leveraging SwiftUI's design capabilities, developers can navigate these challenges effectively.

As we continue to explore and adapt to this evolving framework, it's crucial to remain open to learning and innovation. SwiftUI not only enhances the development process but also invites collaboration between developers and designers, fostering a more integrated approach to app creation.

Special thanks to the organizers of iOSKetchup2024, especially [Inder Deep Singh](https://www.linkedin.com/in/theidsingh/), for inviting me to be a part of the event.

Also to my dear audience, thank you all for the amazing feedback! I truly appreciate it.
{% include image.html src="https://ik.imagekit.io/ogr1ppev3u/OhMySwift/SwiftUI-Bridging-The-Gap/feedback_jDhfCY1dS.jpeg?updatedAt=1723750969624
" alt="SwiftUI's Behavior Across Platforms" %}


I look forward to hearing your thoughts and experiences with SwiftUI. Please feel free to share your insights in the comments below!

### About the author

- **Rizwan Ahmed** - Senior iOS Engineer. 
<br> LinkedIn - <https://www.linkedin.com/in/rizwan95/>
<br> Twitter - <https://twitter.com/rizwanasifahmed>

### More articles

- [From viewWillAppear to viewIsAppearing - Perfecting Your iOS View Transitions](/blog/2023/12/01/from-viewwillappear-to-viewisappearing-perfecting-your-ios-view-transitions/)
- [Exploring the New Push Notifications Console from Apple](/blog/2023/06/19/exploring-the-new-push-notifications-console-from-apple/)
- [How to send Remote Push Notifications to an iOS Simulator with Xcode 14](/blog/2023/05/28/testing-remote-push-notifications-in-ios-simulator-with-xcode-14/)
- [How to Instantly Track a Variable's Value Changes with Xcode Watchpoints](/blog/2023/05/26/how-to-instantly-track-a-variable-s-value-changes-with-xcode-watchpoints/)
- [How to add a loader to an UIButton](/blog/2022/08/28/how-to-add-a-loader-to-an-uibutton/)
- [Implementing a custom native calendar using UICalendarView in iOS16 and Swift](/blog/2022/06/12/implementing-a-custom-native-calendar-using-uicalendarview-in-ios16-and-swift/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
