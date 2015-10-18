//
//  YelpTableViewController.swift
//  FareIt
//
//  Created by Apple on 10/18/15.
//  Copyright © 2015 FareIt. All rights reserved.
//

import UIKit
//import Business

class YelpTableViewController: UITableViewController {
    var array = ["first", "second", "third"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let model = YelpModel.sharedInstance
        var i = Int(arc4random_uniform(19))
        cell.textLabel?.text = model.list[i].name
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        UIApplication.sharedApplication().openURL(NSURL.init(string: "http://maps.apple.com/?q=Mexican")!)
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    
    
    
}
