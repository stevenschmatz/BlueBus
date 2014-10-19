//
//  BusesETA.swift
//  PebbleBus
//
//  Created by Steven on 10/18/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation
import CoreLocation

class BusesETA: NSObject, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    
    var etaList: [ETA] = []
    var userLongitude: Double! = 0.0
    var userLatitude: Double! = 0.0
    var closestStopToUser: Int = 0
    var closestStopName: String = ""
    
    override init() {
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    
//        self.userLatitude = locationManager.location.coordinate.latitude
//        self.userLongitude = locationManager.location.coordinate.longitude

        // CC Little
        self.userLatitude = 42.277683
        self.userLongitude = -83.73494
        
        let stop = getClosestStop()
        self.closestStopToUser = stop.stopID
        self.closestStopName = stop.stopName
        
        var parser = Parser()
        var busesJSON = parser.JSONParseArray(true, stop: closestStopToUser)
        
        println("You are closest to the stop \(closestStopName)")
        
        for busJSON in busesJSON {
            var eta = ETA(jsonDict: busJSON)
            etaList.append(eta)
            println("\"\(eta.busName)\" (\(eta.route)) is \(eta.average) minutes away.")
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println("Location updated")
        var crnLoc: AnyObject = locations.last!
        userLatitude = crnLoc.coordinate.latitude
        userLongitude = crnLoc.coordinate.longitude
        
        println(userLatitude)
        println(userLongitude)
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }
    
    func getClosestStop() -> (stopID: Int, stopName: String) {
        var parser = Parser()
        var stopsJSON = parser.JSONParseArray(false, stop: 0)
        
        var closestStop = 0
        var closestStopName = ""
        var closestDistance = 99999999.0
        
        for stop in stopsJSON {
            let lat = stop["lat"] as Double
            let lon = stop["lon"] as Double
            let stopNum = stop["id"] as Int
            let stopName = stop["name"] as String
            
            let personalLocation = CLLocation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(self.userLatitude), longitude: CLLocationDegrees(self.userLongitude)), altitude: 0, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: NSDate())
            let stopLocation = CLLocation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(lon)), altitude: 0, horizontalAccuracy: 1, verticalAccuracy: 1, timestamp: NSDate())
            
            let dist = personalLocation.distanceFromLocation(stopLocation)
            
            if (dist < closestDistance) {
                closestDistance = dist
                closestStop = stopNum
                closestStopName = stopName
            }
            
        }
        
        return (closestStop, closestStopName);
    }
    
}