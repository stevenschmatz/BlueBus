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
    
    let request = Request()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: false)

        self.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "Lobster Two", size: 34)!]
        
        // Register the UITableViewCell class with the tableView
        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellIdentifier)
        
        request.makeRequest()

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

        // Wait while content is not ready
        while !self.request.contentIsPrepared {}
        
        return self.request.busesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: self.cellIdentifier)
        
        let busName = self.request.busesList[indexPath.row].0
        let busTime = self.request.busesList[indexPath.row].1
        
        cell.textLabel.text = busName
        cell.detailTextLabel?.text = "\(busTime) minutes"
        
        cell.textLabel.font = UIFont(name: "Lobster Two", size: 30)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(100)
    }
 
   
    
}