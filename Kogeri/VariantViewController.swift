//
//  VariantViewController.swift
//  Kogeri
//
//  Created by Frederik Normann on 25/06/15.
//  Copyright (c) 2015 Bolcheriet. All rights reserved.
//

import UIKit
import CoreData

class VariantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var variantTableView: UITableView!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var resultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultsController = getFetchedResultsController()
        resultsController.delegate = self
        resultsController.performFetch(nil)
        
        println("Sections: \(resultsController.sections!.count)")
        if resultsController.sections!.count > 0 {
            println("Objects: \(resultsController.sections![0].numberOfObjects)")
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func refreshButtonTapped(sender: AnyObject) {
        variantTableView.reloadData()
    }
    

    @IBAction func addButtonTapped(sender: AnyObject) {
        
    }
    
    // DATASOURCES
    
    //TableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsController.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var thisVariant = resultsController.objectAtIndexPath(indexPath) as! Variant
        var cell = variantTableView.dequeueReusableCellWithIdentifier("variantCell") as! VariantCell
        
        cell.nameLabel.text = thisVariant.name
        cell.flavourLabel.text = thisVariant.flavour
        
//        println("Cell")
        
        return cell
    }
    
    //CoreData
    
    func getFetchedResultsController() -> NSFetchedResultsController {
        var fetchRequest = NSFetchRequest(entityName: "Variant")
        var sortByName = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortByName]
        
        var controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return controller
    }
    
    
    
    // DELEGATES
    
    //TableView
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let variantToDelete = resultsController.objectAtIndexPath(indexPath) as! Variant
            managedObjectContext?.deleteObject(variantToDelete)
            //variantTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic) //Crashes!!
        }
    }
    
    //CoreData
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        variantTableView.reloadData()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
