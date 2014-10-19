//
//  Parser.swift
//  PebbleBus
//
//  Created by Steven on 10/18/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation

class Parser: NSObject {
    
    var request = Request()
    
    func JSONParseArray(isBusJSON: Bool, stop: Int) -> [AnyObject] {
        var response: (data: String, error: String?)
        
        var responseArray: String
        
        if (isBusJSON) {
            response.data = request.GetBusJSON(stop).data
            var beginIndex: String.Index
            var endIndex: String.Index
            beginIndex = response.data.rangeOfString("[")!.startIndex
            endIndex = response.data.rangeOfString("]")!.startIndex
            
            responseArray = response.data.substringWithRange(beginIndex...endIndex)
        } else {
            responseArray = request.GetStopJSON().data
        }
        
        if let data = responseArray.dataUsingEncoding(NSUTF8StringEncoding) {
            
            if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [AnyObject] {
                return array
            }
        }
        
        return [AnyObject]()
    }
}