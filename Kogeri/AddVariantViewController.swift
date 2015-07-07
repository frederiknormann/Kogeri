//
//  AddVariantViewController.swift
//  Kogeri
//
//  Created by Frederik Normann on 24/06/15.
//  Copyright (c) 2015 Bolcheriet. All rights reserved.
//

import UIKit
import CoreData
import MobileCoreServices

class AddVariantViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var flavourTextField: UITextField!
    @IBOutlet weak var imageCollectionView: UICollectionView!

    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addVariantButtonTapped(sender: AnyObject) {
        let entityDescription = NSEntityDescription.entityForName("Variant", inManagedObjectContext: managedObjectContext!)
        
        var newVariant = Variant(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
        newVariant.name = nameTextField.text
        newVariant.flavour = flavourTextField.text
        
        appDelegate.saveContext()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func cancelButtonTapped(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func addImageButtonTapped(sender: AnyObject) {
    
    }
    @IBAction func cameraButtonTapped(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            var cameraController = UIImagePickerController()
            cameraController.sourceType = UIImagePickerControllerSourceType.Camera
            cameraController.delegate = self
            
            let mediaTypes : [AnyObject] = [kUTTypeImage]
            cameraController.mediaTypes = mediaTypes
            cameraController.allowsEditing = true
        }
    }
    
    
    //DELGATES
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        let imageData = UIImageJPEGRepresentation(image, 1.0)
        //imageCollectionView.add
        self.dismissViewControllerAnimated(true, completion: nil)
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
