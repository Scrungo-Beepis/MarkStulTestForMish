//
//  Log.swift
//  SimpleApp
//
//  Created by Mark Nazzaro on 10/29/18.
//  Copyright © 2018 King Ultimat0's Fabulous Creations. All rights reserved.
//

import UIKit

class Log: NSObject {
    
    var number: Int
    static var count: Int = 0
    var date: String
    
    override init () {
        number = Log.count
        Log.count += 1
        date = DateFormatter.localizedString(from: Date(), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
