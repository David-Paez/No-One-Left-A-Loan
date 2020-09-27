//
//  Twitter_API_custom_test.swift
//  Twitter-API-custom-test
//
//  Created by Gregory Bolet on 9/27/20.
//

import Foundation
//import Dispatch
import SwiftyJSON
import Alamofire

class Tweet: CustomStringConvertible{

    var uname: String;
    var name: String;
    var profileImgURL: String;
    var text: String;
    var createdAt: String;
    
    init(uname: String, name: String,
         profileImgURL: String, text: String,
         createdAt: String){
        
        self.uname = uname;
        self.name  = name;
        self.profileImgURL = profileImgURL;
        self.text = text;
        self.createdAt = createdAt;
    }

    public var description: String { return "[\n\t\(self.uname)\n\t\(self.name)\n\t\(self.profileImgURL)\n\t\(self.text)\n\t\(self.createdAt)\n]" }
}


class TwitterAPI{
    
    private var hashtag = "debtfree";
    private let bearer_token = "";
    
    // URLs for GET and POST calls
    private let rulesURL = "https://api.twitter.com/2/tweets/search/stream/rules";
    private let streamURL = "https://api.twitter.com/2/tweets/search/stream";
    private let timeoutSecs = 10.0;
    //private var tweets = Array<Tweet>();
    
    
    init(){
        print("Using default hashtag: #\(self.hashtag)")
    }
    
//    init(hashtag: String){
//        print("Class has been initalized!");
//        self.hashtag = hashtag;
//    }
    
    /**
     This function sends a user's request and returns the response
     */
    private func sendRequest(request: URLRequest) -> Data{
        let semaphore = DispatchSemaphore (value: 0);
        var toReturn = Data();
        
        let now = DispatchTime.now();
        let later = now + self.timeoutSecs;
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            
          toReturn = data;
          semaphore.signal()
        }

        task.resume();
        semaphore.wait(timeout: later);
        return toReturn;
    }
    
    /**
     This function adds a rule to the Twitter stream filtered requests
     */
    func addRule(searchStr : String, hasImages: Bool){
        print("Adding rule '\(searchStr)'")
        let parameters = "{\n    \"add\": [\n        {\n            \"value\": \"\(searchStr)" + ( hasImages ? " has:images" : "") + "\",\n            \"tag\": \"\(searchStr)\"\n        }\n    ]\n}"
        
        print(parameters)
        let postData = parameters.data(using: .utf8)

        // Wait at most 10 seconds for the request response
        var request = URLRequest(url: URL(string: self.rulesURL)!,
                                 timeoutInterval: self.timeoutSecs)
        request.addValue(self.bearer_token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        
        request.httpMethod = "POST"
        request.httpBody = postData

        self.sendRequest(request: request);
    }
    
    /**
    This function just goes and gets a list of all the rules applied to this stream object.
     Returns a list of rule IDs
     */
    func getAllRuleIDs() -> Array<String> {
        print("Fetching all rules...")
        var request = URLRequest(url: URL(string: self.rulesURL)!,
                                 timeoutInterval: self.timeoutSecs)
        request.addValue(self.bearer_token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"

        // Grab the request result
        let result = self.sendRequest(request: request);
        
        var json = JSON()
        var ids = [String]();
        
        // Attempt to parse the result
        do {
            json = try JSON(data: result)
            //print(json)
            //print(json["data"])
            
            // Go through each piece of data
            for (_, subJSON):(String, JSON) in json["data"]{
                let idVal = subJSON["id"].stringValue
                //print(idVal)
                
                // Append the ruleID to the list
                ids.append(idVal)
            }
            
        }
        catch {
            print("\nERROR IN PARSING JSON!!\n")
        }
        
        print(ids);
        
        return ids;
    }
    
    /**
            This function will push a request to delete each rule
     */
    func deleteAllRules(){
        //print("Deleting all rules...")
        
        let ruleIDs = self.getAllRuleIDs();
        
        var parameters = "{\n    \"delete\": {\n        \"ids\": [\n "
        
        // We need to build the parameters list
        for idx in 0..<(ruleIDs.count-1){
            parameters += "\"" + ruleIDs[idx] + "\",";
        }
        
        // Finish off the param list
        parameters += "\"" + (ruleIDs.last)! + "\"\n        ]\n    }\n}";
        
        
        let postData = parameters.data(using: .utf8)

        // Wait at most 10 seconds for the request response
        var request = URLRequest(url: URL(string: self.rulesURL)!,
                                 timeoutInterval: self.timeoutSecs)
        request.addValue(self.bearer_token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        
        request.httpMethod = "POST"
        request.httpBody = postData
        
        print("Sending delete request")
        // Grab the request result
        let result = self.sendRequest(request: request);
        print("Result of deletion")
        print(result)
        
        let res = self.getAllRuleIDs()
        print("Here are all the Rule IDs")
        print(res)
    }
    
    /**
     Start getting from the stream. PROBLEM CHILD!!!
     */
    func getStream(toCall: @escaping (Tweet, DataStreamRequest.Stream<Data, Never>)-> Void){
        
        print("Getting stream...")
        
        let headers: HTTPHeaders = [
            "Authorization": self.bearer_token
        ]
        let parameters: [String: String] = [
            "tweet.fields": "created_at",
            "expansions": "author_id",
            "user.fields": "created_at,profile_image_url"
        ]
        
        print("Did first call, waiting on it too...")
        
        AF.streamRequest(self.streamURL, method: .get, parameters: parameters,
                         //encoder: JSONParameterEncoder.default,
                         headers: headers).responseStream { stream in
            switch stream.event {
            case let .stream(result):
                switch result {
                case let .success(data):
                    //print(data)
                    //print("We got dataaaaaa!")
                    
                    var json = JSON()
                    
                    // Attempt to parse the result
                    do {
                        json = try JSON(data: data)
                        //print(json)
                        let thisTweet = Tweet(
                            uname: json["includes"]["users"][0]["username"].stringValue,
                            name: json["includes"]["users"][0]["name"].stringValue,
                                              
                            profileImgURL: json["includes"]["users"][0]["profile_image_url"].stringValue,
                            text: json["data"]["text"].stringValue,
                            createdAt: json["data"]["created_at"].stringValue)
                        
                        toCall(thisTweet, stream);
                        //print(type(of: stream))
                        
                    }
                    catch {
                        print("\nERROR IN PARSING JSON!!\n")
                    }
                    
                    //stream.cancel()
                case let .failure(error):
                    print(error)
                    print("We got an error")
                    stream.cancel()
                }
            case let .complete(completion):
                print(completion)
                print("Completed request!")
                //semaphore.signal()
            }
        }
        
        
        
        print("Was this reached?")
        //semaphore.wait()
        print("Finished waiting")
        
    }
    
}

