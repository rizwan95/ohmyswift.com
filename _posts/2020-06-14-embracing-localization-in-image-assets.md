---
layout: post
title: Embracing Localization in Image Assets
date: 2020-06-14 18:41 +0530
category: XCAssets
comments: true
tags: [swift, imageassets, localization, image localization]
author: Rizwan

summary: If your app uses text in images, you should localize it. Localizing image assests which contain text in them is not that hard. Let's find out how to do it.

twitter_card:
   image: /blog/assets/images/Image_localization/appdemo.png

facebook:
    image: /blog/assets/images/Image_localization/appdemo.png
    
---

One of the most significant features which make an app stand out is localization. When we hear the term localization, the first thing that comes to mind is localizing the text displayed in UILabels, UITextViews, UIButtons, and other UIElements. It is quite straight forward to localize the text in the UIElements, and most of us think that we have localized the app, and it is ready to go! But wait, there is one more area I would like to highlight, and that is the images used in the app. You heard me right. If the images used in the app contain text, then they should be localized as well. Localizing the image assets is slightly different but not so hard.

![Localized image asset](/blog/assets/images/Image_localization/appdemo.png){:height="80%" width="80%"}

## How to localize image assets

- Generate the localized images in the languages which your app supports.
- Go to the asset catalog and create an image asset.
- Select the image and click on the attributes inspector.
- From the attributes inspector, click the "Localize" button and select the languages.
- Now, all you have to do is to drop the localized images in the asset catalog.
- You can now see that your images are localized, and your app looks great!

![Localized image asset](/blog/assets/images/Image_localization/imageassetpreview.png){:height="80%" width="80%"}

If you want to know more about localization, refer to the following WWDC session.

- [WWDC 2019 Session 403 Creating Great Localized Experiences with Xcode 11](https://developer.apple.com/videos/play/wwdc2019/403/)

### About the author

- **Rizwan Ahmed** - iOS Engineer. Twitter - <https://twitter.com/rizwanasifahmed>

### More articles

- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)
- [Why should we avoid using closures in Swift structs?](/blog/2020/01/11/why-should-we-avoid-using-closures-in-swift-structs/)
- [Using UICollectionViewCompositionalLayout in iOS 12 and earlier](/blog/2020/03/18/using-uicollectionviewcompositionallayout-in-ios-12-and-earlier/)