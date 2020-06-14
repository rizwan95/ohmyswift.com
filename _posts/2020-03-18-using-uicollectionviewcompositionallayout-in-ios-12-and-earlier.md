---
layout: post
title: "Using UICollectionViewCompositionalLayout in iOS 12 and earlier"
date: 2020-03-18 19:42 +0530
category: UICollectionView
tags: [Swift, uicollectionview, uicollectionviewcompositionallayout, collection view, compositional layouts] 
comments: true
author: Rizwan

summary: Apple added a brand new API "**UICollectionViewCompositionalLayout**" to the UIKit. Well how do we use it in iOS 12.0 and earlier? Well, lets find out. 

twitter_card:
   image: /blog/assets/images/compositionallayout/compositionallayout.png
---

At WWDC 2019, Apple added a brand new API "**UICollectionViewCompositionalLayout**" to the UIKit. Using this powerful API, we can create complex compositional layouts without writing complicated code. At times, It feels tough to create complex collection view UIs using the UICollectionViewFlowLayout. The UICollectionViewCompositionalLayout API eases the process and guess what you can even support orthogonal scrolling UIs with much ease. Well, it sounds great, but practically we cannot use the UICollectionViewCompositionalLayout API until we drop the support for iOS 12.0 and earlier in our apps. (It is not going to happen for the next few years is what I predict.) So how do we use this API in iOS 12.0 and earlier?

![IBPCollectionViewCompositionalLayout](/blog/assets/images/compositionallayout/compositionallayout.png)

Well, a friend of mine, [Kishikawa Katsumi](https://twitter.com/k_katsumi), had a solution for it! He claimed that his library **IBPCollectionViewCompositionalLayout** could use the same UICollectionViewCompositionalLayout APIs in iOS 12.0 and earlier. I was skeptical at first, but decided to give it a try.
I installed it using Cocoapods, followed the instructions given, and boom! CompositionalLayouts started working on iOS 12.0 and earlier!  Everything worked like magic.

I was amazed by the work he had done and decided to share this with the developer community. So here it is!

Do check out this excellent [github library](https://github.com/kishikawakatsumi/IBPCollectionViewCompositionalLayout)  and share your thoughts in comments.

### Credits

- **Kishikawa Katsumi** - <https://twitter.com/k_katsumi>

### About the author

- **Rizwan Ahmed** - iOS Engineer. Twitter - <https://twitter.com/rizwanasifahmed>

### More articles

- [Simulating remote push notifications in a simulator](/blog/2020/02/13/simulating-remote-push-notifications-in-a-simulator/)
- [Why should we avoid using closures in Swift structs?](/blog/2020/01/11/why-should-we-avoid-using-closures-in-swift-structs/)
- [Swift 5 replaces IntroSort with TimSort in the 'sort()' method](/blog/2019/09/29/swift-5-replaces-introsort-with-timsort-in-the-sort-method/)
