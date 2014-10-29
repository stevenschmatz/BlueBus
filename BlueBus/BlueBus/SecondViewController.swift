//
//  SecondViewController.swift
//  BlueBus
//
//  Created by Steven on 10/29/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = Request()
        request.makeRequest()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

