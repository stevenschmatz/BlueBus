//
//  ViewController.swift
//  PebbleBus
//
//  Created by Steven on 10/18/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var parser = Parser(stop: 3)
        var busesJSON = parser.JSONParseArray()
        
        for busJSON in busesJSON {
            var eta = ETA(jsonDict: busJSON)
            println("\"\(eta.busName)\" is \(eta.average) minutes away.")
        }
    
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

