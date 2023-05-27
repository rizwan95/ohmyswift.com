---
layout: post
title: How to filter screenshots, cinematic videos, and depth-effect photos
  in PHPickerViewController
date: 2022-06-26 21:30 +0530
category: PHPickerViewController
tags: [swift, imageassets, phphotopickerviewcontroller, uiimagepikcercontroller, images, phpicker, photolibrary]
comments: true
author: Rizwan Ahmed A
summary: Different apps have different requirements. For example, a hi-res video editing app might be interested in showing cinematic videos and videos. From iOS 16.0, Apple has introduced new APIs, making filtering media very easy. Read the article to learn more. 
keywords: swift, imageassets, phphotopickerviewcontroller, uiimagepikcercontroller, images, phpicker, photolibrary


image:
    path: assets/images/phpicker-filters/Facebook-PHPicker-Filter.png
    twitter: assets/images/phpicker-filters/Twitter-PHPicker-Filter.png
    facebook: assets/images/phpicker-filters/Facebook-PHPicker-Filter.png

---

In iOS 14.0, Apple introduced a new way to pick images from the device's photo library using PHPickerViewController. 
(If you are not aware of PHPickerViewController, I strongly recommend you to read about [PHPickerViewController first.](https://ohmyswift.com/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/))

Different apps have different requirements. For example, a hi-res video editing app might be interested in showing cinematic videos and videos. 
A screenshot stitching app might be interested in showing screenshots upfront. From iOS 16.0, Apple has introduced new APIs, making filtering media very easy. 
If your app wants to show cinematic videos, you can use the `cinematicVideos` enum. 

## PHPickerViewController example of filtering cinematic videos
{% highlight swift %}
var configuration = PHPickerConfiguration()
configuration.filter = .cinematicVideos
let picker = PHPickerViewController(configuration: configuration)
present(picker, animated: true)
{% endhighlight %}

Similarly, you can filter `screenshots`, `screenRecordings`, `depthEffectPhotos`, and much more. You can read the 
PHPickerFilter documentation to learn more about the [new filter enums](https://developer.apple.com/documentation/photokit/phpickerfilter). 

### To filter only screenshots 
{% highlight swift %}
configuration.filter = .screenshots
{% endhighlight %}

### To filter only screen recordings 
{% highlight swift %}
configuration.filter = .screenRecordings
{% endhighlight %}

### To filter only depth effect photos 
{% highlight swift %}
configuration.filter = .depthEffectPhotos
{% endhighlight %}


The best part is that all the filters except `cinematicVideos` , `depthEffectPhotos`, and `bursts` are backported to iOS 15.0 
You can also add compound filters and refine your media results using `all` and `not` . They are also backported to iOS 15.0

### References

[[1] What's new in the Photos picker](https://developer.apple.com/videos/play/wwdc2022/10023/)

[[2] PHPickerViewController ](https://developer.apple.com/documentation/photokit/phpickerviewcontroller)

### About the author

-   **Rizwan Ahmed**  - Senior iOS Engineer, speaker, and an open source enthusiast. Twitter -  [https://twitter.com/rizwanasifahmed](https://twitter.com/rizwanasifahmed)

### Support creators
  **_Show your support to indie devs by downloading their apps from the banner displayed below. It will help them build great apps in these tough times._**
{% include appshowcase-mini.html %}

### More articles

- [Implementing a custom native calendar using UICalendarView in iOS16 and Swift](/blog/2022/06/12/implementing-a-custom-native-calendar-using-uicalendarview-in-ios16-and-swift/)
- [Exploring Deque in Swift Collections](/blog/2021/04/14/exploring-deque-in-swift-collections/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)

