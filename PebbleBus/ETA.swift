//
//  ETA.swift
//  PebbleBus
//
//  Created by Steven on 10/18/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation

class ETA {
    
    let busNames = [
        -2: "Commuter Southbound (Nights)",
        0:  "Commuter Southbound",
        1:  "Commuter Northbound",
        2:  "Northwood",
        68: "Bursley-Baits",
        69: "Bursley-Baits (Nights)",
        72: "Intercampus to East Campus",
        73: "Intercampus to NIB",
        75: "Mitchell-Glazier to Glazier and VA",
        78: "KMS Shuttle",
        87: "Oxford Shuttle",
        92: "Diag to Diag express",
        102: "Commuter Northbound (Nights)",
        107: "Oxford Loop to Diag to Diag Express",
        193: "North Campus",
        198: "Bursley-Baits",
        199: "Northwood",
        200: "Oxford Shuttle"
    ]
    
    var busName: String = ""
    var average: Int = 0
    var busID: Int =  0
    var route: Int = 0
    var type: String = ""

    init(jsonDict: AnyObject) {
        self.average = jsonDict["avg"] as Int
        self.route = jsonDict["route"] as Int
        self.type = jsonDict["type"] as String
        self.busName = setBusName(self.route)
    }
    
    func setBusName(route: Int) -> String {
        var busName = "Unknown"
        
        for (busNumber, busName) in busNames {
            if route == busNumber {
                return busName
            }
        }
        
        return busName
    }
}
