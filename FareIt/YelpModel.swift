//
//  YelpModel.swift
//  FareIt
//
//  Created by Apple on 10/18/15.
//  Copyright © 2015 FareIt. All rights reserved.
//

import Foundation

struct YelpBusiness {
    var id: String
    var name: String
    var imageURL: NSURL? = nil          // image_url
    var location: NSDictionary          // location
    var distance: Double                // distance (meters)
    
    
    init(json: NSDictionary) {
        self.id = json["id"] as! String
        self.name = json["name"] as! String
        if let imageURL = json["image_url"] as? String {
            self.imageURL = NSURL(string: imageURL)
        }
        
        self.location = json["location"] as? NSDictionary ?? [:]
        self.distance = (json["distance"] as? Double) ?? 0
        
    }
    
}

class YelpModel: BDBOAuth1RequestOperationManager {
    let CONSUMER_KEY = "PnVvvzxij6lkmEYSkabEaQ"
    let CONSUMER_SECRET = "f58fJ33_KB5n2GQVzGUausjPofc"
    let TOKEN = "lIEV7uh7yGDW7s57B-ubb4dTXp5MLy6y"
    let TOKEN_SECRET = "97agIHkaQTGq9zrQZX5fdhob50M"
    static let sharedInstance: YelpModel = YelpModel()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    var list: [YelpBusiness] = []
    
    init() {
        let baseURL = NSURL.init(string: "https://api.yelp.com")
        super.init(baseURL: baseURL, consumerKey: CONSUMER_KEY, consumerSecret: CONSUMER_SECRET)
        let token = BDBOAuth1Credential(token: TOKEN, secret: TOKEN_SECRET, expiration: nil)
        self.requestSerializer.saveAccessToken(token)
    }
    func getList() -> [YelpBusiness] {
        return list
    }
    
    
    func search(term: String, done: (businesses: [YelpBusiness], error: NSError?) -> Void) {
//        let latitude = "37.756941"
//        let longitude = "-122.42109"
        let parameters = [
            "term": term,
            "location": "West Lafayette",
            "limit": 20
        ]
        self.GET("/v2/search",
            parameters: parameters,
            success: {
                (operation: AFHTTPRequestOperation!, response: AnyObject) -> Void in
                var list: [YelpBusiness] = []
                var counter: Int = 0
                for jsonBusiness in (response["businesses"] as! NSArray) {
                    list.append(YelpBusiness(json: jsonBusiness as! NSDictionary))
                    self.list.append(list[counter])
                    counter = counter + 1
                }
                done(businesses: list, error: nil)
            },
            
            failure: {
                (operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                done(businesses: [], error: error)
                
            }
            
        )
       

    }
    
}