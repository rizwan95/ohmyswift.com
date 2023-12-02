---
layout: post
title: From viewWillAppear to viewIsAppearing - Perfecting Your iOS View Transitions
date: 2023-09-17 23:25 +0530
category: WWDC23
tags: [swift, xcode, remote push notifications, xcode14, ios simulator, apple silicon, t2 processor, wwdc23, push notification console, ios17, viewIsAppearing]
keywords: viewIsAppearing, swift, xcode, remote push notifications, xcode14, ios simulator, apple silicon, t2 processor, wwdc23, push notification console, ios17
comments: true
author: Rizwan Ahmed A
summary: From viewWillAppear to viewIsAppearing - Perfecting Your iOS View Transitions.

image:
    path: assets/images/push-console/facebook.png
    twitter: assets/images/push-console/twitter.png
    facebook: assets/images/push-console/facebook.png
---

In WWDC23, Apple introduced a nuanced addition to the UIViewController lifecycle: ```viewIsAppearing```. This instance method is a game-changer for developers looking to fine-tune the presentation and layout of their views. Let's explore how this method enhances the way we build responsive and dynamic interfaces.

## The Role of viewIsAppearing

```viewIsAppearing``` is invoked after the view has been inserted into the view hierarchy but before it's laid out, making it an ideal place for last-minute UI updates. Its importance is most evident when dealing with dynamic content that depends on accurate view geometry. Not to forget, ```viewIsAppearing``` is called right after ```viewWillAppear``` 


## Why viewIsAppearing Matters?

**Accurate Geometry:** By the time ```viewIsAppearing`` is called, the view has accurate geometry, including size and safe area insets. <br><br>
**Updated Traits:** The trait collections of the view and view controller are updated, which is crucial for adapting UI based on environmental changes, like Dark Mode or accessibility settings.  <br><br>
**Layout Established:** The superview has laid out the view, making it the right place to make final adjustments or scroll a table view to a specific position.  <br><br>

## When to Use viewIsAppearing?
Here's a practical guide to choosing between ```viewWillAppear``` and ```viewIsAppearing```:

### Use viewWillAppear(_:) for:
Pre-Transition Setup: If you need to prepare something before the view transition begins, like adding alongside animations via the transitionCoordinator.
Balanced Callbacks: For actions not dependent on the traits or geometry of the view, like setting up or tearing down notifications, observers, or other non-UI related tasks.


### Use viewIsAppearing(_:) for:
Trait and Geometry-Dependent Updates: When you need the updated traits and geometry, for example, adjusting UI elements that depend on the size or layout of the view.
Post-Layout Adjustments: If you need to make changes after the view has been laid out by its superview, such as scrolling to a specific position in a UIScrollView.


### Implementing viewIsAppearing
When overriding this method, it's crucial to call super.viewIsAppearing(_:) to maintain the integrity of the lifecycle events. Below is an example illustrating the usage of viewIsAppearing:


{% highlight swift %}
override func viewIsAppearing(_ animated: Bool) {
    super.viewIsAppearing(animated)
    // Assuming a UICollectionView that must scroll to a newly inserted item
    if let newItemIndexPath = newItemIndexPath {
        collectionView.scrollToItem(at: newItemIndexPath, at: .centeredVertically, animated: animated)
    }
}
{% endhighlight %}