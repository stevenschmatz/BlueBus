//
//  FirstTableViewController.swift
//  BlueBus
//
//  Created by Steven on 10/29/14.
//  Copyright (c) 2014 stevenschmatz. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellIdentifier = "cellIdentifier"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: false)

        self.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster Two", size: 34)!]
        
        // Register the UITableViewCell class with the tableView
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ===================================
    // MARK: UITableViewDataSource methods
    // ===================================
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: self.cellIdentifier)
        
        cell.textLabel.text = "Bursley-Baits"
        cell.detailTextLabel?.text = "10 minutes"
        
        cell.textLabel.font = UIFont(name: "Lobster Two", size: 30)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(100)
    }
 
   
    
}