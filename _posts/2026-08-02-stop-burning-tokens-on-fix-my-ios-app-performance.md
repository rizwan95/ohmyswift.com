---
layout: post
title: "Stop Burning Tokens on \"Fix my iOS app performance\""
date: 2026-08-02 16:00 +0530
category: AI
tags: [vibe coding, llm, swiftui, performance, instruments, coding agents, context, ios]
keywords: vibe coding, llm performance, swiftui performance, instruments traces, coding agents, context engineering, ai coding 2026
comments: true
author: Rizwan Ahmed A
summary: A simple onboarding-to-home delay took almost two seconds. I refused to open the code and made the coding agent fix it instead. Skills and better prompts failed. Instruments traces did not.

image:
    path: assets/images/stop-burning-tokens/fb.png
    twitter: assets/images/stop-burning-tokens/twitter.png
    facebook: assets/images/stop-burning-tokens/fb.png
---

I have been vibe coding a lot lately. And if I am honest, writing performant code with these tools is still a struggle. We are in 2026 and somehow most of them are still pretty bad at this part.

The other day it was a simple iOS app. Nothing fancy. Onboarding screen, then the home page. The kind of flow you build without thinking twice.

Except the app took almost 2000 milliseconds to get there.

That number sat with me. Two full seconds for something that should feel instant. I knew something was wrong. My hand went toward the code the way it always does. Then I stopped myself.

I thought, no. Let the agent fix it.

So I told it to fix it. Then I told it again. Then again. Fix it, fix it, fix it.

It did not fix the simple problem. It started inventing new ones. I sat there staring at the chat thinking, this is a flagship model. Why is it behaving like this?

I tried skills next. A swiftui-performance skill, to be precise. The delay stayed. I cleaned the prompt. Rewrote it from scratch. Did all the usual prompt hygiene. Still nothing.

I knew I could open Instruments, find the culprit, and be done in a few minutes. I still waited. I wanted to see if the agent could get there on its own.

It could not.

That is when it hit me. These agents are not failing because they cannot write a performance fix. They are failing because they cannot feel the app the way we do. They do not sit through that awkward pause after onboarding. We do.

So I ran the app through Instruments, grabbed the traces, and fed them into the chat.

Guess what? Tada. It solved the whole thing in a jiffy.

That little moment taught me more than a dozen blog posts about prompting. Context matters. A lot. No matter how good the model is.

Coding agents cannot feel how an app performs. Humans feel that. Agents are excellent at crunching numbers and structured data. Give them meaningful data and the output gets better. That is not some deep secret in 2026. That is just how this works.

The gap is perception. When we say "this is not performing well" or "the animation is laggy," we are describing a feeling. The agent hears a vague complaint. Sometimes that is enough. Sometimes you get a totally different result. Sometimes you accept a half fix and move on. Sometimes you get properly frustrated.

So get the context right, my dear coders. Measure it. Feed the traces. Stop burning tokens on "fix it" when the model cannot see what you feel.

### About the author

- **Rizwan Ahmed** - Developer Relations @ [Zoho Apptics](https://www.zoho.com/apptics/) | Tech Evangelist | AI Researcher | iOS Engineer | Blogger at ohmyswift.com | Speaker | Proud husband.

  
 LinkedIn - [https://www.linkedin.com/in/rizwan95/](https://www.linkedin.com/in/rizwan95/)
  
 Twitter - [https://twitter.com/rizwanasifahmed](https://twitter.com/rizwanasifahmed)

### More articles

- [WWDC26 Platforms State of the Union: A Developer Recap](/blog/2026/06/15/wwdc26-platforms-state-of-the-union-highlights/)
- [The Beautiful Chaos of Building Something Bigger Than Yourself](/blog/2025/09/06/the-beautiful-chaos-of-building-something-bigger-than-yourself/)
- [Why Liquid Glass Is Making Developers Rethink Flutter](/blog/2025/06/28/why-liquid-glass-is-making-developers-rethink-flutter/)
- [SwiftUI in 2024: Bridging Perception and Reality](/blog/2024/08/16/swiftui-in-2024-bridging-perception-and-reality/)
- [Debug Crashes in iOS Using MetricKit](/blog/2025/05/09/debug-crashes-in-ios-using-metrickit/)
