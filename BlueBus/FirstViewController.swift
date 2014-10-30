//
//  FirstTableViewController.swift
//  BlueBus
//
//  Created by Steven on 10/29/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)

        self.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster Two", size: 34)!]

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}