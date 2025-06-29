---
layout: post
title: Debug crashes in iOS using MetricKit
date: 2025-05-08 10:00 +0530
category: Debugging
tags: [swift, debugging, iOS, MetricKit, crash reporting, crash diagnostics, crash analysis, iOS development, Swift debugging, wwdc25]
comments: true
author: Rizwan Ahmed A
summary: Learn how to leverage MetricKit for system-level crash debugging in iOS and integrate with Zoho Apptics for enhanced diagnostics.
keywords: swift, debugging, iOS, MetricKit, crash reporting, crash diagnostics, MXCrashDiagnostic, callStackTree, crash analysis, iOS crash handling, Zoho Apptics

image:
    path: assets/images/metrickit-crash/fb.png
    twitter: assets/images/metrickit-crash/twitter.png
    facebook: assets/images/metrickit-crash/fb.png
---
"Production only" crashes in iOS apps are notoriously difficult to debug. Traditional in-process crash reporting tools install handlers within your app to capture failure data, but if the app crashes hard enough, these reporters themselves may fail.

Apple introduced MetricKit in iOS 13 to address these limitations. Unlike conventional tools, it operates outside your app's process, collecting diagnostics at the system level. This approach captures crashes that traditional reporters miss, including those from memory pressure, background terminations, and OS signals.

In this article, we'll explore how MetricKit helps debug stubborn crashes and complements traditional crash reporting approaches with its system-level capabilities.

## What is MetricKit for Crash Debugging?

MetricKit's crash reporting capabilities provide a system-level framework to collect, analyze, and deliver crash reports to your app. Beyond crashes, MetricKit offers comprehensive diagnostics including performance metrics (CPU/memory usage, launch time, hangs), battery consumption patterns, animation hitches detection, and disk I/O monitoring—all using the same implementation pattern. For crash reporting, it captures detailed diagnostic information including call stacks, exception types, and timestamps of crashes that occur on user devices. This data is collected by iOS and delivered to your app differently depending on which iOS version your users are running:

- **iOS 13-14**: Crash reports are aggregated by iOS and delivered once per day when the user launches your app after the collection period.
- **iOS 15 and later**: Crash reports are delivered immediately on the next launch of your app after a crash occurs.

This improvement in iOS 15 significantly reduces the feedback loop for crash diagnostics, allowing you to identify and fix issues much faster.

## Setting up MetricKit for Crash Reporting

To begin receiving crash reports through MetricKit, follow these steps:

First, import MetricKit in your AppDelegate:

{% highlight swift %}
import MetricKit
{% endhighlight %}

Next, make your AppDelegate conform to the `MXMetricManagerSubscriber` protocol, focusing on crash diagnostics:

{% highlight swift %}
class AppDelegate: UIResponder, UIApplicationDelegate, MXMetricManagerSubscriber {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Register as a subscriber to receive metrics and diagnostics
        MXMetricManager.shared.add(self)
        return true
    }
    
    // Implement the required delegate method for diagnostics
    func didReceive(_ payloads: [MXDiagnosticPayload]) {
        // Process crash reports
        for payload in payloads {
            if let crashDiagnostics = payload.crashDiagnostics {
                handleCrashDiagnostics(crashDiagnostics)
            }
        }
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Unsubscribe when the app terminates
        MXMetricManager.shared.remove(self)
    }
}
{% endhighlight %}

## Processing Crash Reports

Now, let's implement a method to effectively process the crash reports:

{% highlight swift %}
private func handleCrashDiagnostics(_ diagnostics: [MXCrashDiagnostic]) {
    for diagnostic in diagnostics {
        logCrashSummary(diagnostic)
        analyzeCrashCallStack(diagnostic.callStackTree)
        archiveCrashReport(diagnostic)
    }
}
{% endhighlight %}

## Log Crash Summary 

Logs a concise summary of the crash for quick inspection.
{% highlight swift %}
private func logCrashSummary(_ diagnostic: MXCrashDiagnostic) {
    print("🚨 CRASH DETECTED 🚨")
    let crashDictionary = diagnostic.dictionaryRepresentation()
    let crashTimestamp = crashDictionary["timestamp"] ?? Date().description
    print("Timestamp: \(crashTimestamp)")
    print("App version: \(diagnostic.applicationVersion)")
    print("iOS version: \(diagnostic.metaData.osVersion)")
    print("Device type: \(diagnostic.metaData.deviceType)")
    if let exceptionType = diagnostic.exceptionType {
        print("Exception type: \(exceptionType)")
    }
    if let exceptionCode = diagnostic.exceptionCode {
        print("Exception code: \(exceptionCode)")
    }
    if let signal = diagnostic.signal {
        let codeString = diagnostic.exceptionCode?.stringValue
        print(describeCrashSignal(signal, code: codeString))
    }
}
{% endhighlight %}

## Analyze Crash Call Stack 

Analyzes the call stack for common crash patterns and user binaries.

{% highlight swift %}

/// Returns a human-readable description for a crash signal.
private func describeCrashSignal(_ signal: Any?, code: String?) -> String {
    let signalMap: [String: String] = [
        "1": "SIGHUP", "2": "SIGINT", "3": "SIGQUIT", "4": "SIGILL", "5": "SIGTRAP",
        "6": "SIGABRT", "7": "SIGBUS", "8": "SIGFPE", "9": "SIGKILL", "10": "SIGUSR1",
        "11": "SIGSEGV", "12": "SIGUSR2", "13": "SIGPIPE", "14": "SIGALRM", "15": "SIGTERM"
    ]
    var signalName: String?
    if let signalStr = signal as? String, let mapped = signalMap[signalStr] {
        signalName = mapped
    } else if let signalNum = signal as? NSNumber, let mapped = signalMap["\(signalNum.intValue)"] {
        signalName = mapped
    } else if let signalStr = signal as? String {
        signalName = signalStr
    }
    switch signalName {
    case "SIGSEGV":
        return "Segmentation fault (SIGSEGV): Invalid memory access (likely accessing a nil pointer)"
    case "SIGABRT":
        return "Abort (SIGABRT): Process terminated by system (common in unhandled exceptions, assertions)"
    case "SIGBUS":
        return "Bus error (SIGBUS): Misaligned memory access or non-existent memory address"
    case "SIGILL":
        return "Illegal instruction (SIGILL): Invalid instruction attempted (rare, possibly corrupted memory)"
    case "SIGTRAP":
        return "Trap (SIGTRAP): Often from debug breakpoints or exceptions"
    case .some(let name):
        return "Signal: \(name)"
    default:
        return "Unknown signal: \(String(describing: signal))"
    }
}

private func analyzeCrashCallStack(_ callStackTree: MXCallStackTree) {
    let callStackData = callStackTree.jsonRepresentation()
    guard let jsonString = String(data: callStackData, encoding: .utf8) else {
        print("Unable to decode call stack JSON.")
        return
    }
    print("🔍 Call Stack Analysis:")
    printCrashPatternHints(in: jsonString)
    printUserBinaries(in: jsonString)
}

/// Prints hints if common crash patterns are detected in the call stack.
private func printCrashPatternHints(in callStackJSON: String) {
    if callStackJSON.contains("EXC_BAD_ACCESS") {
        print("Memory access issue detected - likely accessing deallocated memory")
    } else if callStackJSON.contains("EXC_BREAKPOINT") {
        print("Exception breakpoint - possibly an unhandled Swift error or assertion")
    } else if callStackJSON.contains("EXC_CRASH") {
        print("Kernel terminated process - often due to memory pressure or watchdog timeout")
    }
}

/// Prints user or third-party binaries found in the call stack.
private func printUserBinaries(in callStackJSON: String) {
    guard let data = callStackJSON.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let callStacks = json["callStacks"] as? [[String: Any]] else {
        print("Could not parse call stack JSON")
        return
    }
    var userBinaries: Set<String> = []
    for stack in callStacks {
        if let frames = stack["callStackRootFrames"] as? [[String: Any]] {
            for frame in frames {
                if let binaryName = frame["binaryName"] as? String, !isSystemBinary(binaryName) {
                    userBinaries.insert(binaryName)
                }
            }
        }
    }
    if userBinaries.isEmpty {
        print("No obvious user or third-party binaries found in call stack.")
    } else {
        print("Potential problematic binaries in call stack: \(userBinaries.joined(separator: ", "))")
    }
}

/// Determines if a binary is a system binary.
private func isSystemBinary(_ binaryName: String) -> Bool {
    let systemPrefixes = ["lib", "UIKit", "Foundation", "Core", "CFNetwork", "dyld", "libsystem"]
    return systemPrefixes.contains { binaryName.hasPrefix($0) }
}
{% endhighlight %}




## Archiving Crash Reports for Analysis

To properly track and analyze crashes over time, implement an archiving system:

{% highlight swift %}
private func archiveCrashReport(_ diagnostic: MXCrashDiagnostic) {
    // Generate a unique ID for the crash
    let crashID = UUID().uuidString
    
    // Create a dictionary with the important crash information
    var crashInfo: [String: Any] = [
        "id": crashID,
        "timestamp": diagnostic.timeStamp.description,
        "appVersion": diagnostic.applicationVersion,
        "osVersion": diagnostic.metaData.osVersion,
        "deviceType": diagnostic.metaData.deviceType
    ]
    
    // Add optional crash details if available
    if let exceptionType = diagnostic.exceptionType {
        crashInfo["exceptionType"] = exceptionType
    }
    
    if let exceptionCode = diagnostic.exceptionCode {
        crashInfo["exceptionCode"] = exceptionCode
    }
    
    if let signal = diagnostic.signal {
        crashInfo["signal"] = signal
    }
    
    // Add call stack if available
    if let callStackTree = diagnostic.callStackTree,
       let callStackData = try? JSONSerialization.data(withJSONObject: callStackTree.jsonRepresentation(), options: []),
       let callStackString = String(data: callStackData, encoding: .utf8) {
        crashInfo["callStack"] = callStackString
    }
    
    // Save or send the crash info
    sendCrashToAnalyticsService(crashInfo)
}

private func sendCrashToAnalyticsService(_ crashInfo: [String: Any]) {
    // Here you would implement your specific analytics service integration
    // Example:
    print("Sending crash to analytics service: \(crashInfo["id"] ?? "unknown")")
    
    // YourAnalyticsService.send(event: "app_crash", properties: crashInfo)
}
{% endhighlight %}

## Simulating Crashes for Testing MetricKit

While implementing MetricKit's crash reporting, you'll need to test whether your implementation works correctly. Let's explore a few simple ways to simulate crashes in your development builds.

### Different Types of Crashes You Can Simulate

Here are some quick and easy ways to simulate various crash types:

#### 1. Array Index Out of Bounds

{% highlight swift %}
let array = [1, 2, 3]
let item = array[10] // This crashes immediately
{% endhighlight %}

#### 2. Force Unwrapping nil

{% highlight swift %}
let text: String? = nil
let unwrapped = text! // Crash!
{% endhighlight %}


## Testing the Full MetricKit Pipeline

After simulating a crash, follow these steps:

1. Launch your app and trigger a crash
2. Fully close the app (swipe up in app switcher)
3. Launch your app again

That's it! If you're testing on iOS 15 or later, MetricKit will deliver the crash report immediately when your app launches again. The `didReceive(_ payloads: [MXDiagnosticPayload])` method will be called with the crash data right away.

If you're testing on iOS 13-14, you'll need to be more patient as MetricKit only delivers reports once per day on those older iOS versions.

Remember that crashes in the debug environment might behave differently than in production. Some crashes might be caught by the debugger, making them harder to test. For the most accurate results, test crashes on a device with a release configuration but still including the debug crash button.

## Integrating with Analytics Services like Zoho Apptics

While MetricKit provides powerful native crash reporting, you might want to integrate it with an analytics service for a more comprehensive solution. [Zoho Apptics](https://www.zoho.com/apptics/) SDK is a good example as it already leverages MetricKit to collect crash data when available:

{% include appshowcase.html %}

### Installing Apptics SDK

You can integrate Apptics SDK in your project using either CocoaPods or Swift Package Manager.

#### Using CocoaPods

Add the following to your Podfile:

{% highlight ruby %}
pod 'Apptics-Swift', '3.1.0'
{% endhighlight %}

Then run:

{% highlight bash %}
pod install
{% endhighlight %}

#### Using Swift Package Manager

You can also add Apptics as a dependency in your `Package.swift` file:

{% highlight swift %}
dependencies: [
    .package(url: "https://github.com/zoho/Apptics.git", from: "3.1.0")
]
{% endhighlight %}

Or directly in Xcode:
1. Go to File > Swift Packages > Add Package Dependency
2. Enter the repository URL: https://github.com/zoho/Apptics.git
3. Select the version you want to use

### Configuring Zoho Apptics

Once installed, you can configure Apptics for crash reporting:

{% highlight swift %}
// First, include Apptics SDK in your app. Usually it is done in the AppDelegate


func configureAppticsForCrashReporting() {
    // Initialize Apptics SDK with your app's configuration
    Apptics.initialize(withVerbose: true)

    // Enable crash reporting
    Apptics.enableAutomaticCrashTracking(true)
    
    // The SDK will automatically collect MetricKit crash diagnostics
    // when available on iOS 14 and above
}


{% endhighlight %}

That's it! It just takes two lines of code. You don't have to manually handle the MetricKit delegates or process the unstructured data. The Zoho Apptics SDK does it for you!

Benefits of integrating with Apptics:
1. Dashboard for crashes reported by MetricKit
2. User session information alongside crash data
3. Automatic symbolication of crash reports

## Conclusion

I hope you've learned about the internal workings of MetricKit through this article. I really enjoyed writing about it and sharing this knowledge at [IndeHub x Zoho Apptics Chapter 9](https://www.linkedin.com/feed/update/urn:li:activity:7316121256502702081/) and the [Swift Summer event at Microsoft Noida](https://www.linkedin.com/feed/update/urn:li:activity:7324718095132983296/). If you've read this far, I truly appreciate your dedication to mastering these concepts! Do try implementing these techniques in your projects and let me know your thoughts in the comments below.


### References

[1] <https://developer.apple.com/documentation/metrickit>

[2] <https://developer.apple.com/documentation/metrickit/mxcrashdiagnostic>

[3] <https://developer.apple.com/videos/play/wwdc2020/10089/>


### About the author

- **Rizwan Ahmed** -
Developer Relations at Zoho Apptics | Tech Evangelist at Zoho | AI Researcher | iOS Engineer | Blogger at ohmyswift.com | Speaker | Mentor <br /> <br />LinkedIn - <https://www.linkedin.com/in/rizwan95/> <br />Twitter - <https://twitter.com/rizwanasifahmed>  <br /> Social media  - <https://bento.me/rizwan95>  <br />



#### More articles

- [SwiftUI in 2024: Bridging Perception and Reality](/blog/2024/08/15/swiftui-in-2024-bridging-perception-and-reality/)
- [From viewWillAppear to viewIsAppearing - Perfecting Your iOS View Transitions](/blog/2023/12/01/from-viewwillappear-to-viewisappearing-perfecting-your-ios-view-transitions/)
- [Customizing UIButton in iOS 15](/blog/2021/08/23/customizing-uibutton-in-ios-15/)
- [Different methods to remove the last item from an array in Swift](/blog/2022/04/24/different-methods-to-remove-the-last-item-from-an-array-in-swift/)
- [Exploring Deque in Swift Collections](/blog/2021/04/14/exploring-deque-in-swift-collections/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)

