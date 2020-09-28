# No One Left A-Loan!

Click [here](https://www.youtube.com/watch?v=5O4sfVG6sK4) for a demo of our app!

## Inspiration
As students afflicted by the Student Loan Debt Crisis ourselves, as well as unfulfilled supporters for crowdfunding websites such as GoFundMe and Kickstarter, we wanted to create a more a trustworthy platform to encourage donors to help out and promote #HealthyConversations revolving what could be considered a topic that's difficult to speak about.

## What it does
No One Left A-Loan is an iOS app that allows users to sign up as either students or donors. On the student side, it allows users to post a small description about themselves as well as the amount of loan debt they owe on a general feed so that donors may help them out through the simple click of a button. We decided to omit profile pictures on the home feed to avoid potential biases when it comes to funding students. In addition, it aims to promote #HealthyConversations revolving around difficult topics to speak about out of fear of public humiliation, such as debt.

## How we built it
To ensure donors that students they donate to are indeed in debt rather than simply saying they are like in other crowdsourcing websites, we utilized the Capital One API to retrieve the true balance of loans associated with the student's account and displayed it directly on the general feed. We integrated the Twitter API to retrieve tweets in realtime associated with hashtags such as #blackexcellence, #reform, and #debt to show users that they are not alone in their situation.

## Challenges we ran into
We had difficulties navigating views and learning how to use SwiftUI, especially because two of our teammates do not have much experience in iOS development. In addition, decoding the responses from the Twitter API and Capital One API proved to be challenging using Swift, but we managed to pull through!

## Accomplishments that we're proud of
We were extremely proud of the fact that we were able to implement not one, but two APIs for the first time since we've gone to hackathons! It allowed us to really see how far we've come since we began hacking as freshmen all the way up until now as seniors.

## What we learned
All of us were newer to SwiftUI, and two of us have very little experience with Swift at all, so we all learned a lot about iOS development! In addition, we were able to learn how to integrate APIs and work with and decode their JSON responses using Swift!

## What's next for No One Left A-Loan
We are planning to port it as a web application as well to provide users with even more chances to help and get help!
