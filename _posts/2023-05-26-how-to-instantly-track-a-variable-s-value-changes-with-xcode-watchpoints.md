---
layout: post
title: How to Instantly Track a Variable's Value Changes with Xcode Watchpoints
date: 2023-05-26 20:34 +0530
category: Debugging
tags: [swift, xcode, track variable value changes in ios, track variable value changes in swift, watchpoints, breakpoints, debugging, llvm]
keywords: xcode, watchpoints, variable value changes, debugging, swift
comments: true
author: Rizwan Ahmed A
summary: Master Watchpoints in Xcode to instantly track variable value changes. This guide illustrates how to boost debugging efficiency with practical examples and step-by-step instructions.
image:
    path: https://ik.imagekit.io/cfsimagecdn/ohmyswift/Fb661DB626-5290-4732-A9BA-A0C41C15AA8E_kTyNJOFl5.png
    twitter: https://ik.imagekit.io/cfsimagecdn/ohmyswift/Tw56C90E33-8619-4C22-BF6B-EBEB6963D733_AbTvbnHXIn.png
    facebook: https://ik.imagekit.io/cfsimagecdn/ohmyswift/Fb661DB626-5290-4732-A9BA-A0C41C15AA8E_kTyNJOFl5.png

---

In the world of programming, tracking variable changes can often turn into a debugging nightmare.
In Xcode, you might find yourself frequently relying on breakpoints and manually tracing the changes in your variables' values. At times, you might also utilize property observers such as ```didSet``` and ```willSet``` for this purpose.
<br  />
<br  />
But what if I tell you, there's a powerful tool waiting for you to harness its capabilities: **Watchpoints**. They allow you to monitor a specific variable or memory address for changes, providing invaluable insights into your program's execution.

## What Are Watchpoints?

Watchpoints are a kind of breakpoint that don't halt the execution of the program when a line of code is reached. Instead, they pause the program when a specific variable changes its value. This feature becomes incredibly useful when you're unsure of where or when a variable's value is being altered in your code.

## How to Set a Watchpoint in Xcode

Setting a watchpoint in Xcode is a straightforward process. Let's walk through it step by step.

### Step 1: Set a Breakpoint and Run Your Program

Firstly, you need to set a regular breakpoint in your program and run it. The breakpoint will pause the execution of the program, enabling you to inspect the current state of your variables.

Consider the following code, 
{% highlight swift %}
struct Employee {
    var salary: Int = 0 {
        didSet {
            print("Salary has been set to \(salary)")
        }
    }
    func changeSalary() {
        var john = Employee()
        john.salary = 5000
        john.salary = 6000
        john.salary = 7000
    }
}
{% endhighlight %}

Set the breakpoint in the line ```john.salary = 5000``` and run the program. 

![Setting a Breakpoint](https://ik.imagekit.io/cfsimagecdn/ohmyswift/057631CA-A6FE-4C87-A9C3-384F8A805E70_0e0STPh2K.png)


### Step 2: Add a Watchpoint

Once your program is paused, navigate to the debug area (at the bottom of the Xcode window). Here, you'll see a list of all the variables currently in scope along with their values.

Find the variable you want to add a watchpoint to, right-click it, and select Watch **'VariableName'**. In our case the **'VariableName'** is replaced by **'salary'**
A watchpoint will be set for that variable.

![Setting an Xcode Watchpoint](https://ik.imagekit.io/cfsimagecdn/ohmyswift/7F06C033-0C65-473E-832A-93FD1641991D_S_Z1PoYTA.png)

### Step 3: Continue Execution

Now, continue running your program. The execution will pause whenever the value of the watched variable changes, allowing you to inspect the new value and see exactly where in your code the change occurred. 
<br  />
In our case, whenever the value of the property **salary** changes, the watchpoint will be hit and the program execution will be paused.

![Xcode Watchpoint](https://ik.imagekit.io/cfsimagecdn/ohmyswift/35F787CE-5024-4EAB-A05F-F5C53AE89290_WfEmylhb1.png?updatedAt=1685121893484)

## Conclusion

Watchpoints are a powerful, yet often overlooked feature in Xcode that can significantly improve your debugging process. The next time you're wrestling with a bug that involves variable value changes, don't forget about the power of watchpoints - they could be the tool you need to squash that bug swiftly.


### References

[1] <https://developer.apple.com/videos/play/wwdc2018/412/>

### About the author

- **Rizwan Ahmed** - iOS Engineer.  Twitter - <https://twitter.com/rizwanasifahmed>

### More articles

- [How to add a loader to an UIButton](/blog/2022/08/28/how-to-add-a-loader-to-an-uibutton/)
- [How to filter screenshots, cinematic videos, and depth-effect photos in PHPickerViewController](/blog/2022/06/26/how-to-filter-screenshots-cinematic-videos-and-depth-effect-photos-in-phpickerviewcontroller/)
- [Implementing a custom native calendar using UICalendarView in iOS16 and Swift](/blog/2022/06/12/implementing-a-custom-native-calendar-using-uicalendarview-in-ios16-and-swift/)
- [Exploring Deque in Swift Collections](/blog/2021/04/14/exploring-deque-in-swift-collections/)
- [Replacing UIImagePickerController with PHPickerViewController](/blog/2020/08/29/replacing-uiimagepickercontroller-with-phpickerviewcontroller/)
- [Embracing Localization in Image Assets](/blog/2020/06/14/embracing-localization-in-image-assets/)
