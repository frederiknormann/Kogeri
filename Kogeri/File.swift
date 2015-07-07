//
//  VariantViewController.swift
//
//
//  Created by Frederik Normann on 24/06/15.
//
//

import UIKit
import CoreData

class VariantViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var variantTableView: UITableView!
    
    var fetchedResultsController = NSFetchedResultsController()
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedResultsController = getFetchedResultController()
        fetchedResultsController.delegate = self
        fetchedResultsController.performFetch(nil)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    
    // TableView DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
        //return fetchedResultsController.sections![section].numberOfObjects
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //var thisVariant = fetchedResultsController.objectAtIndexPath(indexPath) as! Variant
        
        //var cell = tableView.dequeueReusableCellWithIdentifier("variantCell") as! VariantCell
        //cell.nameLabel.text = thisVariant.name
        //cell.flavourLabel.text = thisVariant.flavour
        
        return UITableViewCell()//cell
    }
    
    // TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("tapped cell")
    }
    
    @IBAction func refreshButtonTapped(sender: AnyObject) {
        variantTableView.reloadData()
    }
    
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("presentAddVariant", sender: nil)
    }
    //NSFetchedResultsControllerDelegate
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        println("content changed")
        // variantTableView.reloadData()
    }
    
    //DataModel
    
    func getFetchedResultController() -> NSFetchedResultsController {
        var fetchRequest = NSFetchRequest(entityName: "Variant")
        var sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        var fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchResultsController
    }
}
