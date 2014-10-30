//
//  BusTabBarController.swift
//  BlueBus
//
//  Created by Steven on 10/30/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import UIKit

class BusTabBarController: UITabBarController, UITabBarDelegate {
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (UIApplication.sharedApplication().statusBarStyle.rawValue == UIStatusBarStyle.LightContent.rawValue) {
            UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: false)
        } else {
            UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: false)
        }
    }
}