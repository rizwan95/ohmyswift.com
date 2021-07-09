---
layout: post
title: Enabling 'Sign in with Apple'in developer account
date: 2019-08-12 10:26 +0530
category: Sign in with Apple
tags: [swift, iOS, Sign in with Apple]
comments: true
og_title: Enabling 'Sign in with Apple'in developer account
og_description: Article about enabling 'Sign in with Apple' in iOS apps
og_image: /blog/assets/images/signinconfig01.png
og_type: blog
author: Rizwan

---

'**Sign in with Apple**' is an exciting feature announced in WWDC 2019. You must be wondering how to get started. Well, this article is about completed the configuration, [Click here](/blog/2019/08/06/integrating-sign-in-with-apple-in-ios-apps/) to know how to integrate 'Sign in with Apple' feature in your iOS apps.

{% include appshowcase-mini.html %}

### Requirements
- **Paid Apple developer account.**
- **Xcode 11 (It is still in beta, at the time of writing.)**

### Let's get started

- Login in to your Apple developer account and head to '**Certificates, identifiers, and profiles**' tab.
- Click the '**More**' tab from the left menu and select the 'configure' button.

![Sign in with Apple configuration](/blog/assets/images/signinconfig01.png)



### Registering Domains and Emails, 
In the Configuration screen, you will be asked to provide a registered domain name, associated email address, and an individual email address. After specifying the domain and email address, you will be given an option to download a verification file.  Place the verification file at the path '**https://yourdomainname.com/.well-known/apple-developer-domain-association.txt**'

![Sign in with Apple configuration](/blog/assets/images/signinconfig02.png)


### Enabling 'Sign in with Apple' in Identifiers

It will take some time for the verfication process to be completed. Once it is done, head back to the '**Identifiers**' tab and enable the '**Sign in with Apple**' option. 

![Sign in with Apple configuration](/blog/assets/images/signinconfig03.png)


You have now successfully enabled '**Sign in with Apple**' in your developer account. You can now regenerate the profiles, download,and use them.

### Where now?

 As you have succesfully enabled 'Sign in with Apple' in your developer account, you would want to integrate it in your iOS apps. Head [here](/blog/2019/08/06/integrating-sign-in-with-apple-in-ios-apps/) to know how to do it. 

Have any queries? Reach out to me on [Twitter](https://twitter.com/rizwanasifahmed) and feel free to share your thoughts in the comments below. 

