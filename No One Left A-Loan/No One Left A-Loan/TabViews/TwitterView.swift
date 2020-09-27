//
//  FeedView.swift
//  No One Left A-Loan
//
//  Created by Leila Adaza on 9/26/20.
//

import SwiftUI
import CoreData

struct TwitterView: View {
    @ObservedObject var tweets: TweetModel = generateTweet(tweets: TweetModel())
    var count: Int = 0
    var body: some View {
        VStack {
            Color("barGray")
                .edgesIgnoringSafeArea(.all)
                .frame(height:1)
                .overlay(Text("#HealthyConversations").bold().padding(.bottom,30))
            List(tweets.tweets) { tweet in
                VStack(alignment: .leading) {
                    Text(tweet.userName)
                        .font(.body)
                    Spacer()
                    Text(tweet.summary)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
            }
        }
    }
}

struct TwitterView_Previews: PreviewProvider {
    static var previews: some View {
        TwitterView(tweets:TweetModel()).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

func generateTweet(tweets:TweetModel) -> TweetModel{
    let myAPI = TwitterAPI()
    myAPI.deleteAllRules()
    myAPI.addRule(searchStr: "blackexcellence", hasImages: false)
    myAPI.addRule(searchStr: "debt", hasImages: false)
    myAPI.addRule(searchStr: "reform", hasImages: false)
    //myAPI.getAllRuleIDs()
    var numCalls = 0;
    myAPI.getStream()
    { (tweetObj, streamObj) in
        print("Got a new tweet! Updating View!")
        print(tweetObj)
        tweets.add(userName: tweetObj.uname, imageURL: tweetObj.profileImgURL, summary: tweetObj.text)
        
        numCalls += 1;
        print("Called: \(numCalls) times")
        if numCalls == 50{
            streamObj.cancel()
        }
    }
    return tweets
}
