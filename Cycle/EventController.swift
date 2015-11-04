//
//  EventController.swift
//  Cycle
//
//  Created by MAC on 10/10/15.
//  Copyright © 2015 Luis Conde. All rights reserved.
//

import UIKit

class EventController: UIViewController, UITableViewDelegate,UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    
    
    let events = ["Rodada Universitaria", "Inauguración de Ciclopista", "Gran Bazar de Bicicletas"]
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.events[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?
    {
        
        let shareAction = UITableViewRowAction(style: .Normal, title: "Ver") { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            
            let FirstActivityItem = self.events[indexPath.row]
             let activityViewController = UIActivityViewController(activityItems: [FirstActivityItem], applicationActivities: nil)
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = UIColor.blueColor()
        
        return [shareAction]
    }
    
    
}
