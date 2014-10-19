//
//  PebbleConnection.swift
//  PebbleBus
//
//  Created by Steven on 10/19/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import Foundation

class PebbleConnection: NSObject, PBPebbleCentralDelegate {

    var connectedWatch = PBWatch()
    let UUID = "0902a0a7-ca40-4299-8fcc-abb641ee0007"
    var myAppUUIDBytes = UnsafeMutablePointer<UInt8>()
    
    override init() {
        super.init()
        
        // Pebble setup
        self.connectedWatch = PBPebbleCentral.defaultCentral().lastConnectedWatch()
        PBPebbleCentral.defaultCentral().delegate = self
        
        // Last connected watch
        println("Last connected watch: \(self.connectedWatch)")
        
        // Set UUID
        var myAppUUID = NSUUID(UUIDString: self.UUID)
        myAppUUID.getUUIDBytes(myAppUUIDBytes)
        PBPebbleCentral.defaultCentral().appUUID = NSData(bytes: myAppUUIDBytes, length: 16)
        
        self.connectedWatch.appMessagesLaunch({(watch: PBWatch!, error: NSError!) in
            if (error == nil) {
                println("Successfully launched app.")
            } else {
                println("Error launching app: \(error)")
            }
        })
        
        self.connectedWatch.appMessagesGetIsSupported({(watch: PBWatch!, isAppMessagesSupported: Bool) in
            if isAppMessagesSupported {
                println("This Pebble supports app messages!")
            } else {
                println("This Pebble does not support app messages!")
            }
        })
    }
    
    func sendDictionary(dict: NSDictionary) {
        self.connectedWatch.appMessagesPushUpdate(dict, onSent: {(watch: PBWatch!, dict: [NSObject: AnyObject]!, error: NSError!) in
            if error == false {
                println("Successfully sent message.")
            } else {
                println("Error sending messages: \(error)")
            }
        })
    }
    
    func pebbleCentral(central: PBPebbleCentral!, watchDidConnect watch: PBWatch!, isNew: Bool) {
        println("\(watch) connected!")
        self.connectedWatch = watch
    }
    
    func pebbleCentral(central: PBPebbleCentral!, watchDidDisconnect watch: PBWatch!) {
        println("\(watch) disconnected")
    }
}