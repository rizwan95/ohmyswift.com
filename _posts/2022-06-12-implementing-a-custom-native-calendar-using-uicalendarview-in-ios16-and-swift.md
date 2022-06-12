---
layout: post
title: Implementing a custom native calendar using UICalendarView in iOS16 and Swift
date: 2022-06-12 18:08 +0530
category: UIKit
tags: [swift, UICalendarView, FSCalendar, customize calendar in iOS16, iOS 16, calendar view, single select calendar, multi select calendar, swift calendar implementation]
comments: true
author: Rizwan
summary: In WWDC22, Apple introduced UICalendarView to create custom calendar views from iOS 16. Let's explore how easy it is now to implement a calendar view in iOS, iPadOS, and macCatalyst.
image:
    path: https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UICalendarView/Facebook_-_CalendarView_z3q3oXgwh.png?ik-sdk-version=javascript-1.4.3&updatedAt=1655044984772
    twitter: https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UICalendarView/Twitter_-_CalendarView_qqOP90n99.png
    facebook: https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UICalendarView/Facebook_-_CalendarView_z3q3oXgwh.png

---


It was WWDC22 week, and I was browsing through my Twitter feed to get some updates about the latest Apple APIs. A person tweeted, "No matter how experienced you are as an iOS developer, you'll always look it up how to set up a date formatter." So I humorously replied to the tweet by saying, "Dates are hard 😜 ." 

After a while, something struck my mind, and I was curious to know if Apple had made improvements to the existing date picker. To my surprise, Apple introduced **UICalendarView** to create custom calendar views from iOS 16. 

At that moment, I could realize how easy it would become for an iOS developer to implement and customize calendar views. Previously, we used third-party calendar components, which came with issues and bugs. Let's see how to implement a custom native calendar using UICalendarView in iOS 16 and Swift.

  
## Setting up UICalendarView



![Setting up UICalendarView](https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UICalendarView/tr:w-300,h-300,r-15/UICalendarViewInit_FeL27ply-l.png?style=centerme)

UICalendarView belongs to the UIKit framework and comes with a simple initializer.


{% highlight swift %}

let calendarView = UICalendarView()
let gregorianCalendar = Calendar(identifier: .gregorian)
calendarView.calendar = gregorianCalendar

{% endhighlight %}


**Note:** Apple tells us that it is necessary to mention the calendar type explicitly while creating a UICalendarView object. In our example, it will be gregorian calendar.

**API availablility:** UICalendarView is available from _iOS16.0+, iPadOS16.0+, and macCatalyst16.0+_



  

## Customizing UICalendarView 

![Customizing UICalendarView](https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UICalendarView/tr:w-300,h-300,r-15/UICalendarViewCustomization_39npX0m3z.jpg?style=centerme)
  

UICalendarView supports various customizations like setting the background color, setting the view's corner radius, changing the calendar's tint color, and many more.


{% highlight swift %}

calendarView.backgroundColor = .secondarySystemBackground
calendarView.layer.cornerCurve = .continuous
calendarView.layer.cornerRadius = 10.0
calendarView.tintColor = UIColor.systemTeal

{% endhighlight %}

  
  

## UICalendarView Decorators

  ![UICalendarView Decorators](https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UICalendarView/tr:w-300,r-15/UICalendarViewDecorators_cNitUyfGJ.jpg?style=centerme)


UICalendarView comes with a UICalendarViewDelegate, which allows us to add date-specific decorations. It will be beneficial while showing free/busy events in a calendar.

Make sure you set the delegate object as well.


{% highlight swift %}

calendarView.delegate = self

{% endhighlight %}

  

{% highlight swift %}

func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
    let font = UIFont.systemFont(ofSize: 10)
    let configuration = UIImage.SymbolConfiguration(font: font)
    let image = UIImage(systemName: "star.fill", withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal)
    return .image(image)
}

{% endhighlight %}

  


In the above example, I have added a yellow star image to all the dates in the calendar. You can write your logic to customize the decorators.

  

## Restricting date selection

  ![Restricting date selection](https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UICalendarView/tr:w-300,r-15/UICalendarViewDateRange_0kAXnCWGA.jpg?style=centerme)


You can also specify the date ranges that the user can choose. In the above example, you can see that the dates before 12 June 2022 are disabled.

  

{% highlight swift %}

calendarView.availableDateRange = DateInterval.init(start: Date.now, end: Date.distantFuture)

{% endhighlight %}



  

## Selection behavior in UICalendarView

There are two types of selection behavior in UICalendarView: Single date selection and multi-date selection. Whether you need a single or multi-date selection must be specified in the _selectionBehaviour_ property of the calendar view.

  

### For single selection

{% highlight swift %}

let dateSelection = UICalendarSelectionSingleDate(delegate: self)
calendarView.selectionBehavior = dateSelection

{% endhighlight %}

  

### For multi-date selection

  

{% highlight swift %}

let dateSelection = UICalendarSelectionMultiDate(delegate: self)
calendarView.selectionBehavior = dateSelection

{% endhighlight %}

  

## Single date selection in UICalendarView

  ![Single date selection in UICalendarView](https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UICalendarView/tr:w-300,r-15/UICalendarViewSingleSelection_6fZrAC2CY.png?style=centerme)


Single date selection in UICalendarView is done using _UICalendarSelectionSingleDateDelegate_
The delegate provides us with two methods.

 
{% highlight swift %}


func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
    print("Selected Date:", dateComponents)
}

  
func dateSelection(_ selection: UICalendarSelectionSingleDate, canSelectDate dateComponents: DateComponents?) -> Bool {
    return true
}

{% endhighlight %}


The _didSelectDate_ method gives us a date whenever the user taps on a date in the UICalendarView.

The _canSelectDate_ method is an optional delegate method using which you can decide whether to allow the user to select a specific date or not.

  

  

## Multi-date selection in UICalendarView

  ![Multi-date selection in UICalendarView](https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UICalendarView/tr:w-300,r-15/UICalendarMultiDateSelection_2NLs5RooT.jpg?style=centerme)


Multi-date selection in UICalendarView is done using _UICalendarSelectionMultiDateDelegate_

  
The delegate provides us with the following methods.

  
{% highlight swift %}
func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didSelectDate dateComponents: DateComponents) {
    print("Selected Date:", dateComponents)
}
{% endhighlight %}

  

The _didSelectDate_ method gives us the selected date by the user.

  

{% highlight swift %}
func multiDateSelection(_ selection: UICalendarSelectionMultiDate, didDeselectDate dateComponents: DateComponents) {
    print("De-Selected Date:", dateComponents)
}
{% endhighlight %}

The _didDeselectDate_ method gives us the deselected date by the user.



{% highlight swift %}  
func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canSelectDate dateComponents: DateComponents) -> Bool {
    return true
}
{% endhighlight %}

{% highlight swift %}  
func multiDateSelection(_ selection: UICalendarSelectionMultiDate, canDeselectDate dateComponents: DateComponents) -> Bool {
    return true
}
{% endhighlight %}

  

The _canSelectDate_ and _canDeseectDate_ are optional delegate methods using which you can decide whether to allow the user to select/deselect a specific date or not.

  



### Closing thoughts

I see UICalendarView as a considerable improvement when compared to UIDatePicker. I enjoyed exploring the UICalendarView API. I hope you will too. Do share your thoughts about UICalendarView API.


### References 

[1] <https://developer.apple.com/documentation/uikit/uicalendarview>

[2] <https://developer.apple.com/videos/play/wwdc2022/10068/>



### About the author

- **Rizwan Ahmed** - Senior iOS Engineer, speaker, and an open source enthusiast.  Twitter - <https://twitter.com/rizwanasifahmed>

### Support creators
  **_Show your support to indie devs by downloading their apps from the banner displayed below. It will help them build great apps in these tough times._**
{% include appshowcase-mini.html %}


### More articles

- [Different methods to remove the last item from an array in Swift](/blog/2022/04/24/different-methods-to-remove-the-last-item-from-an-array-in-swift/)
- [Exploring Deque in Swift Collections](/blog/2021/04/14/exploring-deque-in-swift-collections/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)

