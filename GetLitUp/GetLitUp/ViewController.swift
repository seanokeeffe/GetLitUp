//
//  ViewController.swift
//  GetLitUp
//
//  Created by CS121 on 11/14/14.
//  Copyright (c) 2014 Hack. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        stadiumName.delegate = self
        sectionNumber.delegate = self
        seatNumber.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true);
        return false;
    }

    
    
    @IBOutlet weak var timerValue: UILabel!
    
    
    
    @IBOutlet weak var stadiumName: UITextField!
    @IBOutlet weak var sectionNumber: UITextField!
    @IBOutlet weak var seatNumber: UITextField!
    
    @IBAction func SendData(sender: AnyObject) {
        var stadiumNameText = stadiumName.text
        var sectionNumberText = sectionNumber.text
        var seatNumberText = seatNumber.text
        var serverData = ServerData(stadiumName: stadiumNameText, sectionNumber: sectionNumberText, seatNumber: seatNumberText)
        var flash = Flashlight(startTime: serverData.startTime, statusArray: serverData.statusArray)
        NSLog("Got past creation")
        flash.getCamera()
        flash.checkStart()
    }
}

