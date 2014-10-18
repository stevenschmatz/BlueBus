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
    var latitude: Double = 0
    var longitude: Double = 0
    var heading: Int = 0
    var route: Int = 0
    var lastStop: Int = 0
    var lastUpdate: Int = 0
    
    init(jsonDict: AnyObject) {
        self.id = jsonDict["id"] as Int
        self.latitude = jsonDict["lat"] as Double
        self.longitude = jsonDict["lon"] as Double
        self.heading = jsonDict["heading"] as Int
        self.route = jsonDict["route"] as Int
        self.lastStop = jsonDict["lastStop"] as Int
        self.lastUpdate = jsonDict["lastUpdate"] as Int
    }
    
    func prettyPrint() {
        println("Bus \(self.id) is at \(latitude), \(longitude).")
    }
    
    func computeDistanceFrom(long: Double, lat: Double) -> Double {
        println("\(long), \(self.longitude)")
        println("\(pow(long - self.longitude, 2))")
        return sqrt(pow(long - self.longitude, 2) + pow(lat - self.latitude, 2))
    }
}