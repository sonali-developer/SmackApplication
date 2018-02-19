//
//  Channel.swift
//  SmackFinalApp
//
//  Created by Sonali Patel on 2/19/18.
//  Copyright © 2018 Sonali Patel. All rights reserved.
//

import Foundation

struct Channel: Decodable {
    public private(set) var channelTitle: String!
    public private(set) var channelDescription: String!
    public private(set) var id: String!
}
