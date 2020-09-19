---
layout: post
title: "Replacing UIImagePickerController with PHPickerViewController"
date: 2020-08-29 11:09 +0530
category: PHPickerViewController
comments: true
tags: [swift, imageassets, phphotopickerviewcontroller, uiimagepikcercontroller, images]
author: Rizwan
summary: From iOS 14.0, Apple is providing its developers a brand new way to select images/videos from their apps using ```PHPickerViewController``` Let's find out how to implement it.
twitter_card:
   image: /blog/assets/images/phpickerviewcontroller/phpickerviewcontroller-twitter.png
facebook:
    image: /blog/assets/images/phpickerviewcontroller/phpickerviewcontroller-facebook.png

---
Almost every app requires photos and video access these days. Before iOS 14.0, the iOS developers used ```UIImagePickerController``` to access the items from the user's media library. From iOS 14.0, Apple is providing its developers a brand new way to select images or videos from their apps using ```PHPickerViewController```

## Features of PHPickerViewController

- **No more permission alerts.** The developer doesn't have to specify the ```Privacy - Photo Library Usage Description``` key in the .plist, and there won't be any alert views asking for permission.
- **Runs in a separate process.** Although the PHPickerViewController might appear to be present inside the application, it runs in a separate process.
- **Built-in privacy.** Since PHPickerViewController runs in a separate process, the application can only access the items selected by the user via PHPickerViewControllerDelegate.
- **Built-in search.** Searching photos is a built-in feature in PHPickerViewController, and the UI is similar to that of the Photos app.
- **Selection limit.** PHPickerViewController also allows the developer to limit the number of photos a user can select by setting the **selectionLimit** property in PHPickerConfiguration.

## Implementing PHPickerViewController in an application

Implementing ```PHPickerViewController``` is a breeze. The APIs are pretty straightforward.

- Create an instance of PHPickerConfiguration and pass it to the ```PHPickerViewController``` instance while creating it.
- It is the developer's responsibility to present or dismiss the ```PHPickerViewController```

{% highlight swift %}
import PhotosUI

private func showPicker() { 
   let configuration = PHPickerConfiguration()
   let picker = PHPickerViewController(configuration: configuration)
   self.present(picker, animated: true, completion: nil)
}
{% endhighlight %}

## Customizing the PHPickerViewController using the PHPickerConfiguration

The PHPickerConfiguration provides us three properties using which we can customize the PHPickerViewController.

- ```selectionLimit``` - The selectionLimit property specifies the number of items a user can select. The value ```0``` specifies unlimited selection. The below configuration limits the selection to 4 items.

{% highlight swift %}
configuration.selectionLimit = 4
{% endhighlight %}

- ```filter``` - The filter property restricts the type of items that can be displayed. Setting the value to ```nil``` will display all the supported items. The below configuration displays only the live photos and images.

{% highlight swift %}
configuration.filter = .any(of: [.livePhotos, .images])
{% endhighlight %}

- ```preferredAssetRepresentationMode``` - The preferredAssetRepresentationMode determines how an item provider should represent an asset. The default value is ```automatic```.     The below configuration sets the asset's representation mode to automatic.

{% highlight swift %}
configuration.preferredAssetRepresentationMode = .automatic
{% endhighlight %}


## Accessing items from PHPickerViewController using the PHPickerViewControllerDelegate

The PHPickerViewControllerDelegate acts differently when compared to UIImagePickerControllerDelegate. PHPickerViewControllerDelegate provides us an NSItemProvider using which objects can be loaded.

If you look closely, the API will be similar to UITableView's or UICollectionView's drag and drop APIs.

{% highlight swift %}
func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    dismiss(animated: true)
    let itemProviders = results.map(\.itemProvider)
    for item in itemProviders {
        if item.canLoadObject(ofClass: UIImage.self) {
            item.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    if let image = image as? UIImage {
                        self.imageView.image = nil
                        self.imageView.image = image
                    }
                }
            }
        }
    }
}
{% endhighlight %}

PHPickerViewController is supported only from iOS 14.0. If your app has a deployment target of iOS 13.0 and less, you still have to use  UIImagePickerController.

## Resources

- [Amazing Photo picker sample code](https://github.com/rizwan95/AmazingPhotoPicker)
- [Meet the new Photos picker](https://developer.apple.com/videos/play/wwdc2020/10652/)

### Special mention

Recently, [FeedSpot](https://blog.feedspot.com) added [Ohmyswift](https://ohmyswift.com) to its "Top 30 Swift Programming Blogs & News Websites To Follow in 2020." It is an honor to us, and it means a lot to us. Do check out their listings at

- [https://blog.feedspot.com/swift_programming_blogs/](https://blog.feedspot.com/swift_programming_blogs/)

### About the author

- **Rizwan Ahmed** - iOS Engineer. Twitter - <https://twitter.com/rizwanasifahmed>

### More articles

- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
- [An effective way to clear entire Userdefaults in Swift](/blog/2020/05/19/an-effective-way-to-clear-entire-userdefaults-in-swift/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)
- [Why should we avoid using closures in Swift structs?](/blog/2020/01/11/why-should-we-avoid-using-closures-in-swift-structs/)
