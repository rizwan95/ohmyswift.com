---
layout: post
title: Introducing URLSessionWebSocketTask - Native WebSocket implementation using
  Swift 5
date: 2019-08-31 19:10 +0530
comments: true
category: URLSession
tags: [swift, iOS, websockets, URLSessionWebSocketTask]
author: Rizwan
---

We all love WebSockets, don't we? They have a vast range of applications such as chat applications, push notifications, and much more. I got excited when I stumbled upon 
“URLSessionWebSocketTask”. That's right, in addition to data task, download task, and upload task, we have websocketTask! in URLSession. Websockets are now first-class citizens in the foundation framework. Before websocket tasks, we had to use third-party libraries like Star Scream or Socket Rocket, but it is not the case anymore.

{% include appshowcase-mini.html %}

![Socket connection in Swift](/blog/assets/images/websockettask.jpg)


Let's see how we can implement it in our project(s). 
I have created a separate class named "WebSocketConnector," which acts as a socket connection manager/handler where all the socket related code is present. 

URLSessionWebSocketTask is an extension of URLSessionTask. 

We first have to create a urlsession object. The urlsession object has a method called as "websocketTask(with: URL)" using which we can create a websocket task. 
The websocketTask method takes a socket URL as a parameter. For the demo, we are going to use "wss://echo.websocket.org" to test our socket connection.

{% highlight swift %}
init(withSocketURL url : URL){
        super.init()
        urlSession  = URLSession(configuration: .default, delegate: self, delegateQueue: operationQueue)
        socket = urlSession.webSocketTask(with: url)
    }
{% endhighlight %}



I have created a WebSocketProtocol and our  WebSocketConnector confroms to it. We implement the "establishConnection()" method, disconnect method, and send methods. 

{% highlight swift %}
func establishConnection(){
        socket.resume()
        addListener()
    }
{% endhighlight %}


In the "establishConnection" method, we call the "resume()" method on the socket and add a listener to the socket. The "addListener()" method gets invoked whenever the app receives a message or an error from the server. 

After establishing a connection,  we can send a message or data to the server. As the server which we use is an echo server, it gives you back the message which you send.  

{% highlight swift %}
    private func addListener(){
        socket.receive {[weak self] (result) in
            switch result {
            case .success(let response):
                switch response {
                    
                case .data(let data):
                    self?.didReceiveData?(data)

                case .string(let message):
                    self?.didReceiveMessage?(message)
                }
            case .failure(let error):
                self?.didReceiveError?(error)
            }
        }
    }

func send(message: String) {
        socket.send(URLSessionWebSocketTask.Message.string(message)) {[weak self] (error) in
            if let error = error {
                self?.didReceiveError?(error)
            }
        }
    }

{% endhighlight %}

So whenever a successful message is received, the "didReceiveMessage?(message)" is triggered. When an error is received, the "didReceiveError?(error)" is invoked. 

When we need to close the connection, we call the "disconnect()" method. Simple, isn't it?

I enjoyed implementing it, and it is a great relief that Apple provided us native WebSocket support. However, we still have to rely on third-party libraries if we are supporting iOS 12 and below. If your deployment target is 13.0 and above, you can go with "URLSessionWebSocketTask" without any hesitations. 

You can find the completed project [here](https://github.com/rizwan95/SwiftWebSockets).
I am excited to see you people implement URLSessionWebSocketTask in your projects. Do share your experience and of course, if you have any questions, ask them in the comments. You can also reach out to me directly on [Twitter](https://twitter.com/rizwanasifahmed)

