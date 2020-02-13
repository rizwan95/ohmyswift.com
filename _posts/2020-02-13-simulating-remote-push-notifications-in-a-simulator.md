---
layout: post
title: Simulating remote push notifications in a simulator
date: 2020-02-13 22:22 +0530
category: Swift, ios simulator, simulator notifications
comments: true
---
Apple just released Xcode 11.4 beta with tons of features. One of the notable features is simulating remote push notifications in simulators, which means that triggering remote notifications in simulators is now possible. 

## Requirements

Well, the requirements are quite simple. We will be needing the following,

- Xcode 11.4 beta or above.
- Bundle identifier of your app.
- The device identifier of your currently active simulator.
- Push notification payload.
- Terminal.

## How to find the device identifier of the simulator?

 You can find the simulator's device identifier from **Window** -> **Devices and Simulator** -> **Select the active simulator** -> **Copy the displayed identifier**

## How to generate push notification payload?

The push notification payload is of the standard Apple format.

    {"aps":{"alert":"I am a remote push notification","badge":1,"sound":"default"}}


   Save the following JSON in the .apns format.
    (We will be saving the json in a file as notficationpayload.apns for the tutorial purpose. )

## How to trigger remote push notifications in the simulator?

- Run the app in simulator using Xcode.
- Open terminal.
- Navigate to the folder where the payload file is present .
- Execute the command with the format, 
 ```xcrun simctl push <device-identifier> <your-bundle-id> notificationpayload.apns```
 (Sample command -
 ```xcrun simctl push 3A3CE233-307D-463D-A1C6-F66B9C2C1445 com.sample.pushnotification notificationpayload.apns```)

- Hit enter.

That's it! Notifications will start to appear on your simulator!

![Simulating remote push notifications in a simulator](/blog/assets/images/simulatornotifications/simulatornotification.png)

 Enjoyed reading it? Feel free to share your comments below. Like this article? Share it with your friends!
 You can also follow me on twitter right here: <https://twitter.com/rizwanasifahmed>
