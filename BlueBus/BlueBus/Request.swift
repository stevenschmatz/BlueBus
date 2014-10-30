//
//  Request.swift
//  BlueBus
//
//  Created by Steven on 10/29/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation

class Request: NSObject {
    
    // =================
    // MARK: Initializer
    // =================
    
    override init() {
      
        // Otherwise check the backup JSON file
        let path = NSBundle.mainBundle().pathForResource("routeNames", ofType: "json")
        let jsonData = NSData(contentsOfFile: path!, options: .DataReadingMappedIfSafe, error: nil)!
        
        var error: NSError?
        
        backupRoutes = NSJSONSerialization.JSONObjectWithData(jsonData, options: nil, error: &error) as NSDictionary
        
    }
    
    // ==========
    // MARK: URLs
    // ==========
    
    // DESCRIPTION: Serves a REST API which feeds route number-ETA pairs
    func estimatedTimeURL(routeNumber: Int) -> NSURL {
        let urlString = "http://mbus.doublemap.com/map/v2/eta?stop=" + String(routeNumber)
        return NSURL(string: urlString)!
    }
    
    // DESCRIPTION: Serves a REST API which feeds route number-route name pairs
    let routesURL = NSURL(string: "http://mbus.doublemap.com/map/v2/routes")!
    
    // ================
    // MARK: Data Model
    // ================
    
    // DESCRIPTION: An array of all active route dictionaries.
    var routes = NSArray()
    var backupRoutes = NSDictionary()
    var busesList: [ (String, Int)] = []
    var contentIsPrepared = false


    
    // ===========================
    // MARK: Testing and Debugging
    // ===========================
    
    // DESCRIPTION: CC Little bus stop. Used for debugging.
    let testRoute = 137
    
    // ==============
    // MARK: Requests
    // ==============
    
    // EFFECTS: Initializes the hierarchy of callbacks.
    func makeRequest() {
        self.getRoutesArray()
    }
    
    private func getETAArray(stop: Int) {
        
        self.busesList = []
        
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = estimatedTimeURL(stop)
        request.HTTPMethod = "GET"
        
        var response = AutoreleasingUnsafeMutablePointer<NSURLResponse?>()
        var err: NSErrorPointer = nil
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            if error != nil {
                println("ERROR: Request.swift: getETAArray: \(error.localizedDescription)")
                return
            }
            
            let jsonObject : AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
            if let etaArray = jsonObject as? NSDictionary {
                
                let ETAs: NSArray = etaArray["etas"]![String(stop)]!!["etas"]!! as NSArray
                
                for eta in ETAs {
                    let routeNumber = eta["route"]!! as Int
                    let timeInMinutes = eta["avg"]!! as Int
                    
                    if timeInMinutes <= 60 {
                        let tuple = (busName: self.getNameForRoute(routeNumber), busTime: timeInMinutes)

                        self.busesList.append(self.getNameForRoute(routeNumber), timeInMinutes)
                        
                        println("\(self.getNameForRoute(routeNumber)) is going to come in \(timeInMinutes) minutes.")
                    }
                    
                    self.contentIsPrepared = true
                }
                
            } else {
                println("ERROR: Request.swift: getETAArray: Unable to typecast jsonObject to NSArray")
            }
        })
    }
    
    // EFFECTS: Asynchronously gets the array of route dictionaries from routesURL.
    private func getRoutesArray() {
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.URL = routesURL
        request.HTTPMethod = "GET"
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:{ (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
        
            if error != nil {
                println("ERROR: Request.swift: getRoutesArray: \(error.localizedDescription)")
            }
            
            let jsonObject : AnyObject! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil)
            if let routeArray = jsonObject as? NSArray {
                println("Routes found!")
                self.routes = routeArray
                self.getETAArray(self.testRoute)
                
            } else {
                println("ERROR: Request.swift: getRoutesArray: Unable to typecast jsonObject to NSArray")
            }
        })
    }
    
    // REQUIRES: getRoutesArray() has run
    // EFFECTS:  Returns the name for the route number.
    private func getNameForRoute(routeNumber: Int) -> String {

        // Check if bus name is on online route list
        for route in self.routes {
            if route["id"]!! as Int == routeNumber {
                return route["name"]! as String
            }
        }
        
        // Otherwise return from the backup store
        if backupRoutes[String(routeNumber)] != nil {
            return backupRoutes[String(routeNumber)] as String!
        } else {
            return "Other BlueBus"
        }
    }
}