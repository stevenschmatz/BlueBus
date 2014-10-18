//
//  ETARequest.swift
//  PebbleBus
//
//  Created by Steven on 10/18/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation

class ETARequest {
    func makeRequest() {
        var request = HTTPTask()
        request.POST("http://mbus.doublemap.com/map/v2/eta", parameters: ["stop": 2], success: {(response: HTTPResponse) in
            println(response.responseObject!)
            },failure: {(error: NSError) in
                println("File not found: \(error)")
        })
    }
}