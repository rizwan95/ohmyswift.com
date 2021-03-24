---
layout: post
title: Common problems and workarounds while building apps using Apple Silicon
date: 2020-12-19 09:57 +0530
category: Apple Silicon
comments: true
tags: [apple silicon, cocoapods, cocoapods apple silicon, cocoapods not installing in apple silicon, firebase, firebase not building in apple silicon, firebase in apple silicon, firebase apple silicon, m1 processor, apple silicon project not building]
author: Rizwan
summary: Let's learn how to resolve common errors which occur while building our apps in Apple Silicon
image:
    path: assets/images/apple-silicon-problems/Apple-Silicon-Facebook.jpeg
    twitter: assets/images/apple-silicon-problems/Apple-Silicon-Twitter.jpeg
    facebook: assets/images/apple-silicon-problems/Apple-Silicon-Facebook.jpeg

---
Apple's new Apple Silicon (M1 processor) is a beast. The apps open pretty quickly, and the slow Xcode build times are a thing of the past. But what does it have in store for the iOS/macOS developers? 

When you try to run your existing projects on Apple Silicon devices, there are a few problems you have to resolve before your projects could build. I will list three significant issues and their solution, which most developers are likely to face when running the projects in Apple Silicon devices.

### Running Cocoapods on Apple Silicon (M1 processor)

Cocoapods is not entirely compatible with ARM architecture at the time of writing this article. The reason is, Cocoapods has an internal dependency on the [Ruby-FFI](https://github.com/ffi/ffi) gem, which is not yet compatible with the ARM architecture. When you do a  ```sudo pod install``` , you are likely to bump into the following error.

{% highlight zsh linenos %}
LoadError - dlsym(0x7f8926035eb0, Init_ffi_c): symbol not found - /Library/Ruby/Gems/2.6.0/gems/ffi-1.13.1/lib/ffi_c.bundle
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/Library/Ruby/Gems/2.6.0/gems/ffi-1.13.1/lib/ffi.rb:6:in `rescue in <top (required)>'
/Library/Ruby/Gems/2.6.0/gems/ffi-1.13.1/lib/ffi.rb:3:in `<top (required)>'
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/Library/Ruby/Gems/2.6.0/gems/ethon-0.12.0/lib/ethon.rb:2:in `<top (required)>'
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/Library/Ruby/Gems/2.6.0/gems/typhoeus-1.4.0/lib/typhoeus.rb:2:in `<top (required)>'
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/System/Library/Frameworks/Ruby.framework/Versions/2.6/usr/lib/ruby/2.6.0/rubygems/core_ext/kernel_require.rb:54:in `require'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/sources_manager.rb:74:in `cdn_url?'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/sources_manager.rb:36:in `create_source_with_url'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/sources_manager.rb:21:in `find_or_create_source_with_url'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer/analyzer.rb:178:in `block in sources'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer/analyzer.rb:177:in `map'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer/analyzer.rb:177:in `sources'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer/analyzer.rb:1073:in `block in resolve_dependencies'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/user_interface.rb:64:in `section'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer/analyzer.rb:1072:in `resolve_dependencies'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer/analyzer.rb:124:in `analyze'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer.rb:414:in `analyze'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer.rb:239:in `block in resolve_dependencies'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/user_interface.rb:64:in `section'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer.rb:238:in `resolve_dependencies'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/installer.rb:160:in `install!'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/command/install.rb:52:in `run'
/Library/Ruby/Gems/2.6.0/gems/claide-1.0.3/lib/claide/command.rb:334:in `run'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/lib/cocoapods/command.rb:52:in `run'
/Library/Ruby/Gems/2.6.0/gems/cocoapods-1.10.0/bin/pod:55:in `<top (required)>'
/usr/local/bin/pod:23:in `load'
/usr/local/bin/pod:23:in `<main>'
{% endhighlight %}

### Solution
The solution is pretty straight forward. You have to run the following commands,
{% highlight zsh %}
sudo arch -x86_64 gem install ffi
sudo gem install cocoapods
{% endhighlight %}
What we are doing is, we are running the Ruby-FFI gem with backward compatibility. 
Some developers run the ```Terminal.app``` with Rosetta and perform the usual ```sudo gem install ffi``` installation. The developer can choose whatever method they prefer. 


###  Apple Silicon simulator support for Firebase

Firebase is one of the most extensively used frameworks out there. When you try to run your existing project in an Apple Silicon simulator using Xcode, you will probably bump into the following error. 

{% highlight llvm %}
ld: in /Users/myusername/Downloads/202009/temp/My_Project/Pods/FirebaseAnalytics/Frameworks/FIRAnalyticsConnector.framework/FIRAnalyticsConnector(FIRAnalyticsConnector_e321ed8e3db06efc9803f6c008e67a34.o), building for iOS Simulator, but linking in object file built for iOS, file '/Users/myusername/Downloads/202009/temp/My_Project/Pods/FirebaseAnalytics/Frameworks/FIRAnalyticsConnector.framework/FIRAnalyticsConnector' for architecture arm64
{% endhighlight %}

### Solution
Luckily the Firebase developers have come up with a pretty neat workaround. The developers have to specify the  ```-M1 ``` tag along with the Firebase pod version.  For example,
```pod 'Firebase/Analytics', '7.2-M1' ``` 
You can use the same workaround for other Firebase related pods as well. The workaround is documented in [here.](https://github.com/firebase/firebase-ios-sdk/blob/master/AppleSilicon.md)

### Broken redirections from default web browsers to apps in Apple Silicon

Most of the Sign-in/Sign-up module in apps open up the user's default browser. After the user successfully signs in, the browser redirects back to the app. The handoff can break if the user uses a browser that is not yet built for the Apple Silicon processors. The sign-in will not happen, and it could make the app unusable. This issue occurred with Firefox Developer Edition, which was not yet built for Apple Silicon at the time of writing this blog.

### Solution 
The developer can show an alert or a message before the user attempts to sign-in about the problem. They can request the user to change their default browser to Safari or any other compatible browser. After the sign-in is done, the user can revert to their favorite browser as the default browser. 


### Closing thoughts

Good times are ahead. There is a lot to learn and to teach. I enjoyed writing and sharing this article. In the future, I will be writing more about such issues as they are discovered. Do you feel that I am missing out on something important? Do let me know in the comments below. Also, if you find this article useful, feel free to share it. 

### References
- [Cocoapods and Apple Silicon](https://stackoverflow.com/questions/64901180/running-cocoapods-on-apple-silicon-m1)
- [Firebase and Apple Silicon](https://github.com/firebase/firebase-ios-sdk/issues/6520)


### App Showcase

We always want to give back to the community. So we decided that we will review some of the most amazing apps which we had used. Please download their apps and show them your support. 

#### App name - Winya (iOS and iPad OS app)

A ***free screen-sharing app*** that casts your screen to Twitch in HD. It will be useful for gamers to streaming their gameplay to Twitch.
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
