//
//  SecondViewController.swift
//  BlueBus
//
//  Created by Steven on 10/29/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
                            
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func viewDidLoad() {
        self.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster Two", size: 34)!]
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: false)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

