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
    var stop: Int
    
    init(stop: Int) {
        self.stop = stop
    }
    
    func JSONParseArray() -> [AnyObject] {
        var response = request.GetBusJSON(self.stop)
        
        let beginIndex = response.data.rangeOfString("[")?.startIndex
        let endIndex = response.data.rangeOfString("]")?.endIndex

        let responseArray = response.data.substringWithRange(beginIndex!..<endIndex!)
        
        if let data = responseArray.dataUsingEncoding(NSUTF8StringEncoding) {
            
            if let array = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)  as? [AnyObject] {
                return array
            }
        }
        
        return [AnyObject]()
    }
}