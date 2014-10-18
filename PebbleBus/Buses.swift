//
//  Buses.swift
//  PebbleBus
//
//  Created by Steven on 10/18/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation

class Buses {
    var busList: [Bus] = []
    
    init() {
        var parser = Parser()
        var array = parser.JSONParseArray()
        
        for item in array {
            var bus = Bus(jsonDict: item)
            busList.append(bus)
        }
    }
    
    func printAllBuses() {
        for bus in busList {
            bus.prettyPrint()
        }
    }
    
    func getClosestBus(longitude: Double, latitude: Double) -> Bus? {
        
        if busList.count == 0 {
            
            return nil
            
        } else {
            
            var closestBus = busList[0]
            
            for bus in busList  {
                if bus.computeDistanceFrom(longitude, lat: latitude) < closestBus.computeDistanceFrom(longitude, lat: latitude) {
                    closestBus = bus
                }
            }
            
            return closestBus
        }
    }
}