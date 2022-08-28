---
layout: post
title: How to add a loader to an UIButton
date: 2022-08-28 21:28 +0530
---
Sometimes, we would require a button to show a loader with appropriate text when a long-duration task is done, such as downloading an image. Before iOS 15, we had to write a custom button or do some hacks to show a simple loader or an UIActivityIndicator inside an UIButton. Now, it is not the case anymore. UIButtonConfiguration provides ```showsActivityIndicator```, a simple property using which we can hide/show a loader inside a button.

We recommend that you visit [this article](/blog/2021/08/23/customizing-uibutton-in-ios-15/) if you are unfamiliar with UIButtonConfiguration. 


### To hide the loader or activity indicator 
{% highlight swift %}
var configuration = UIButton.Configuration.filled()
configuration.showsActivityIndicator = false
{% endhighlight %}


![To hide the loader or activity indicator in a UIButton](https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UIButton/tr:w-300,r-15/tap_to_download?ik-sdk-version=javascript-1.4.3&updatedAt=1661706066724&style=centerme)

### To show the loader or activity indicator
{% highlight swift %}
var configuration = UIButton.Configuration.filled()
configuration.showsActivityIndicator = true
{% endhighlight %}

![To show the loader or activity indicator in a UIButton](https://ik.imagekit.io/ogr1ppev3u/OhMySwift/UIButton/tr:w-300,r-15/downloading_image?ik-sdk-version=javascript-1.4.3&updatedAt=1661705998865&style=centerme)

## Customizing the color of the loader or activity indicator

We can also customize the color of the loader or activity indicator by using the ```UIConfigurationColorTransformer```. 

We can use two options: choose the default ones (grayscale, preferredTint, or monochromeTint) or use our custom color. 

### Default color usage

{% highlight swift %}
var configuration = UIButton.Configuration.filled()
configuration.activityIndicatorColorTransformer = UIConfigurationColorTransformer.preferredTint
{% endhighlight %}

### Custom color usage 

{% highlight swift %}
var configuration = UIButton.Configuration.filled()
configuration.activityIndicatorColorTransformer = UIConfigurationColorTransformer({ _ in
    return .systemYellow
})
{% endhighlight %}

The UIButton provides us a ```configurationUpdateHandler``` where we can change the button's appearance using the configuration. The ```configurationUpdateHandler``` is triggered when the ```setNeedsUpdateConfiguration``` method is called on the button.


{% highlight swift %}
var  shouldToggleActivityIndicator: Bool = false {
    didSet {
        self.button.setNeedsUpdateConfiguration()
    }
}

private  func  configureButton() {
    var configuration = UIButton.Configuration.filled()
    configuration.title = "Download"
    configuration.showsActivityIndicator = false
    button = UIButton(configuration: configuration, primaryAction: UIAction { _ in
        self.shouldToggleActivityIndicator.toggle()
    })
    button.configurationUpdateHandler = { button in
        var config = button.configuration
        if  self.shouldToggleActivityIndicator == true {
            config?.title = "Downloading"
        }else {
            config?.title = "Download"
        }
        config?.showsActivityIndicator = self.shouldToggleActivityIndicator
        config?.activityIndicatorColorTransformer = UIConfigurationColorTransformer({ _ in
            return .systemYellow
        })
        button.configuration = config
    }
}
{% endhighlight %}

## References

[1] <https://developer.apple.com/documentation/uikit/uibutton/configuration>

### About the author

- **Rizwan Ahmed** - iOS Engineer.  Twitter - <https://twitter.com/rizwanasifahmed>

### Support creators
{% include appshowcase-mini.html %}

### More articles

- [How to filter screenshots, cinematic videos, and depth-effect photos in PHPickerViewController](/blog/2022/06/26/how-to-filter-screenshots-cinematic-videos-and-depth-effect-photos-in-phpickerviewcontroller/)
- [Implementing a custom native calendar using UICalendarView in iOS16 and Swift](/blog/2022/06/12/implementing-a-custom-native-calendar-using-uicalendarview-in-ios16-and-swift/)
- [Exploring Deque in Swift Collections](/blog/2021/04/14/exploring-deque-in-swift-collections/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)

