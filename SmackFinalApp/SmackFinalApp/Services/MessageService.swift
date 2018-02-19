//
//  MessageService.swift
//  SmackFinalApp
//
//  Created by Sonali Patel on 2/19/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class MessageService {
    
    static let instance = MessageService()
    
    var channels = [Channel]()
    
    func findAllChannels(completion: @escaping CompletionHandler) {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARER_HEADER).responseJSON { (response)  in
            if response.result.error == nil {
                guard let data = response.data else { return }
                if let json = JSON(data: data).array {
                   for item in json {
                    let name = item["name"].stringValue
                    print(name)

                        let channelDescription = item["description"].stringValue
                    print(channelDescription)
                        let id = item["_id"].stringValue
                    print(id)

                       let channel = Channel(channelTitle: name, channelDescription: channelDescription, id: id)
                       self.channels.append(channel)
                    }
                    print(self.channels.count)
                    //print(self.channels[0].channelTitle)
                  completion(true)
              }
                
            } else {
               completion(false)
               debugPrint(response.result.error as Any)
           }
        }
        
}
}
