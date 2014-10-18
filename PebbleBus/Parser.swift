//
//  Parse.swift
//  PebbleBus
//
//  Created by Steven on 10/18/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation

struct Bus {
    var id: Int
    var name: Int
    var latitude: Double
    var longitude: Double
    var heading: Int
    var route: Int
    var lastStop: Int
    var lastUpdate: Int64
}

class Parser: NSObject {
    
    var request = Request()

    func JSONParseArray() -> [AnyObject] {
        var response = request.GetBusJSON()
        
        if let data = response.data.dataUsingEncoding(NSUTF8StringEncoding) {
            
            if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [AnyObject] {
                return array
            }
        }
        
        return [AnyObject]()
    }
}