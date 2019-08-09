---
layout: post
title: Integrating 'Sign in with Apple' in iOS apps
date: 2019-08-06 07:41 +0530
category: Swift, iOS, Sign in with Apple
---

The WWDC 2019 gave us many features to look forward. One of the most exciting features and my favorite is the 'Sign In with Apple' feature in iOS 13. The users can sign in securely, and their privacy is guaranteed. Apple is holding up their biggest promise of privacy with this feature. It is available for web and other platforms as well. We will be exploring and learning the integration of 'Sign In with Apple' on different platforms in the upcoming articles. Now, let us get started with how we can integrate it into our iOS app.

### Requirements

* Xcode 11 (in beta at the time of writing the article)
* Apple developer account.

### Steps to integrate 'Sign In with Apple'
Before getting started, you have to setup keys for 'Sign in with Apple' feature. If you haven't checked it out, you can do it here.

Alright, let's get started!
#### _Step 1_
Create a new project in Xcode.

#### _Step 2_ 
Head to Signing and capabilities tab.
Hit the '+ Capability' option and select 'Sign In with Apple.'

#### _Step 3_
Navigate to the class where you want to set up the 'Sign in with Apple' button. I have built a SignInHandler class which encapsulates all the sign-in code and logic.

#### _Step 4_
Import the framework 'AuthenticationServices' in your class.

#### _Step 5_
Create an instance of ASAuthorizationAppleIDButton class and add it as a subview to the view along with the necessary constraints. 

{% highlight swift %}

//Code to create an instance of the 'Sign In with Apple' button
@available(iOS 13.0, *)
func createAppleSigninButton() -> ASAuthorizationAppleIDButton{
    let signInButton = ASAuthorizationAppleIDButton()
    signInButton.addTarget(self, action: #selector(handleSigninAction), for: .touchUpInside)
    return signInButton
}

{% endhighlight %}


#### _Step 6_
Now, we have to write the implementation for handleSigninAction.

{% highlight swift %}

@available(iOS 13.0, *)
@objc func handleSigninAction() {
// 1
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()

//2
    request.requestedScopes = [.fullName, .email]

//3
    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
}

{% endhighlight %}


#### Here is the breakdown of the above given code snippet,

1. We are using an instance of ASAuthorizationAppleIDProvider inorder to create a request. 


2. We need only the full name and email of the user. Hence, we have mentioned them in the 'requestedScopes.'


3. Finally, we pass the request to the ASAuthorizationController. 

On tapping the 'Sign in' button, 'handleSigninAction' method is triggered, and the ASAuthorizationController is presented, which prompts the user to use Apple sign-in. 

#### Step 7
There are two scenarios after presenting the ASAuthorizationController. Either the user successfully signs in, or an error occurs. 
The delegates, 'didCompleteWithAuthorization' or 'didCompleteWithError' get callbacks for the success or failure scenarios, respectively.

We will write an extension to SignInHandler class and conform it to 'ASAuthorizationControllerDelegate.' If the user successfully logs in, the user's details such as  full name, email id. etc can be extracted from 'ASAuthorizationAppleIDCredential'. 

If any error occurs during the login process, it should be handled in 'didCompleteWithError' method. 


{% highlight swift %}

@available(iOS 13.0, *)
extension SignInHandler : ASAuthorizationControllerDelegate{
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            print(userIdentifier,fullName ?? "Not found",email ?? "Not found")
        } 
    }
    
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        //Handle error here.
        print(error)
    }
}

{% endhighlight %}

There is an another delegate called as 'ASAuthorizationControllerPresentationContextProviding'. It is not required to implement this delegate, but it is highly recommended to implement it. 

All we have to do is provide the current window. 

{% highlight swift %}


func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
    return view.window ?? UIWindow()
}

{% endhighlight %}
