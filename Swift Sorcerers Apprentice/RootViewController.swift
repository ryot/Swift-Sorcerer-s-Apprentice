//
//  RootMenuVC.swift
//  Swift Sorcerers Apprentice
//
//  Created by Ryo Tulman on 6/21/14.
//  Copyright (c) 2014 Ryo Tulman. All rights reserved.
//

import UIKit

class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView
    var tasks: String[] = ["Stacks", "Queues", "Binary Tree", "Binary Search Tree", "Hash Table"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection: Int) -> Int {
        return self.tasks.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        cell.textLabel.text = self.tasks[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var newVC: UIViewController?
        let taskString = self.tasks[indexPath.row]
        
        switch taskString {
        case "Stacks":
            newVC = self.storyboard.instantiateViewControllerWithIdentifier("stacksVC") as? UIViewController
        default:
            newVC = nil
        }
        
        if (newVC) {
            self.showViewController(newVC, sender: self)
        } else {
            var alert = UIAlertController(title: "Not Yet Available", message: "This apprentice task is currently under conjuration. Please check back later!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style:UIAlertActionStyle.Default, handler: {
                (action: UIAlertAction!) in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
    }
}

