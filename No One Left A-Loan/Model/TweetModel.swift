//
//  StudentModel.swift
//  No One Left A-Loan
//
//  Created by David Paez on 9/27/20.
//

import Foundation
import Combine

struct Twit: Identifiable {
    var id:Int
    var userName:String
    var imageURL:String
    var summary:String
}

class TweetModel: ObservableObject {
    @Published var tweets: [Twit] = []
    var lastID:Int = -1

    private func newId()->Int{
        lastID += 1
        return lastID
    }
    
    init()
    {
        tweets = []
    }
    
    func add(userName: String, imageURL:String, summary:String){
        let tweet = Twit(id: newId(), userName: userName, imageURL: imageURL, summary: summary)
        tweets += [tweet]
    }
}
