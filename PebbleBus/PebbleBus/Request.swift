//
//  Request.swift
//  PebbleBus
//
//  Created by Steven on 10/18/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation

class Request: NSObject {
    
    // URL of the bus JSON
    let url = "http://mbus.doublemap.com/map/v2/buses"
    
    // EFFECTS: Sends an HTTP request with the given callback.
    func SendHTTPRequest(request: NSMutableURLRequest, callback: (String, String?) -> Void) {
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            (data, response, error) -> Void in
            if error != nil {
                callback("", error.localizedDescription)
            } else {
                callback(NSString(data: data, encoding: NSUTF8StringEncoding), nil)
            }
        }
        
        task.resume()
    }
    
    // EFFECTS: Makes a GET request to the given URL.
    func HTTPGet(url: String, callback: (String, String?) -> Void) {
        var request = NSMutableURLRequest(URL: NSURL(string: url))
        SendHTTPRequest(request, callback: callback)
    }
    
    // EFFECTS: Connects to the Michigan magic bus application.
    func GetBusJSON() -> (data: String, error: String?) {
        var loadData = ""
        var loadError: String? = nil
        
        HTTPGet(self.url) {
            (data: String, error: String?) -> Void in
            if error != nil {
                println("Error: \(error)")
            } else {
                loadData = data
                loadError = error
            }
        }
      
        // This is weird... if you don't sleep, this doesn't work
        sleep(1)
        
        return (loadData, loadError)
    }
}