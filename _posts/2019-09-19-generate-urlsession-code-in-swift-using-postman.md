---
layout: post
title: Generate URLSession code in Swift using Postman
date: 2019-09-19 00:31 +0530
category: Postman
tags: [swift, postman]
author: Rizwan
---
Almost every iOS developer would have had to make a network call from their app. Swift uses URLSession to make network calls. URLSessionTask includes DataTask, UploadTask, DownloadTask, and WebsocketTask (WebsocketTask is lately introduced in iOS13.0 check [this article](/blog/2019/08/31/introducing-urlsessionwebsockettask-native-websocket-implementation-using-swift-5/) to know more about it.)
I was testing a multipart data request API using the [Postman app.]<https://www.getpostman.com/> The API worked, the file got uploaded, and the results came in.
However, I needed to write the Swift code to make a multipart request from the iOS app.
Writing code for data task can be simple, but the complexity increases when we write code for multipart requests. I was wondering whether Postman can generate the multipart data request code for me, turns out that it could!

![Generate Swift code using Postman](/blog/assets/images/postman-swift.png)

After you had entered the API endpoint details like URL, query params, request body, and request headers hit the "code" button.

![Postman main screeen](/blog/assets/images/postman-main-screen.png)

Select Swift as the programming language, and you will be able to see the Swift code for the request.
Neat, isn't it? The generated code comes in very handy for developers and saves much time. Of course, we have to modify the code here and there to suit our needs, but it saves much time!

![Postman Swift snippet 1](/blog/assets/images/postman-swift-snippet-1.png)

![Postman Swift snippet 2](/blog/assets/images/postman-swift-snippet-2.png)

Got any remarks? Feel free to comment them below. You can also reach out to me at [Twitter](https://twitter.com/rizwanasifahmed)
