//
//  FirstViewController.swift
//  Kogeri
//
//  Created by Frederik Normann on 24/06/15.
//  Copyright (c) 2015 Bolcheriet. All rights reserved.
//

import UIKit

class NextShowViewController: UIViewController {

    @IBOutlet weak var nextShowDatePicker: UIDatePicker!
    
    @IBOutlet weak var datePickerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tabBarController?.selectedIndex = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showDatePickerButtonTapped(sender: AnyObject) {
        datePickerView.hidden = false
    }

    @IBAction func setTimeButtonTapped(sender: AnyObject) {
        datePickerView.hidden = true
    }

}

