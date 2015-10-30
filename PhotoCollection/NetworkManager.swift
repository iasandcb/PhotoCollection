//
//  NetworkManager.swift
//  Catalog
//
//  Created by SDT2 on 2015. 10. 29..
//  Copyright © 2015년 all4web. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let sharedManager = NetworkManager()
    
    let manager: Manager
    var images = [String]()
    
    init() {
        var defaultHeaders = Manager.sharedInstance.session.configuration.HTTPAdditionalHeaders ?? [:]
        defaultHeaders["X-Parse-REST-API-Key"] = ""
        defaultHeaders["X-Parse-Application-Id"] = ""
        
        let configuration = NSURLSessionConfiguration.defaultSessionConfiguration()
        configuration.HTTPAdditionalHeaders = defaultHeaders
        manager = Alamofire.Manager(configuration: configuration)
    }
    
    func fetchImages() {
        images.removeAll(keepCapacity: true)
        manager.request(.GET, "https://api.parse.com/1/classes/Post").responseJSON { response in
            let json = JSON(response.result.value!)
            
            for (_, subJson):(String, JSON) in json["results"] {
                print(subJson)
                let url = subJson["image"]["url"].stringValue
                print(url)
                self.images.append(url)
            }
            NSNotificationCenter.defaultCenter().postNotificationName(ImageUpatedNotification, object: nil)
        }
    }
    
}