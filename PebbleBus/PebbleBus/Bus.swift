//
//  Bus.swift
//  PebbleBus
//
//  Created by Steven on 10/18/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation

class Bus {
    var id: Int = 0
    var name: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var heading: Int = 0
    var route: Int = 0
    var lastStop: Int = 0
    var lastUpdate: Int = 0
    
    init(jsonDict: AnyObject) {
        self.id = jsonDict["id"] as Int
        self.name = jsonDict["name"] as String
        self.latitude = jsonDict["lat"] as Double
        self.longitude = jsonDict["lon"] as Double
        self.heading = jsonDict["heading"] as Int
        self.route = jsonDict["route"] as Int
        self.lastStop = jsonDict["lastStop"] as Int
        self.lastUpdate = jsonDict["lastUpdate"] as Int
    }
    
    func prettyPrint() {
        println("Bus \(self.name) with ID \(self.id) is at \(latitude), \(longitude).")
    }
}