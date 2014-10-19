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
        
        var dataModel = DataModel()
        dataModel.sendDisplayDataToPebble()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

