//
//  ViewController.swift
//  GetLitUp
//
//  Created by CS121 on 11/14/14.
//  Copyright (c) 2014 Hack. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var stadiumName: UITextField!
    @IBOutlet weak var sectionNumber: UITextField!
    @IBOutlet weak var seatNumber: UITextField!

    
    @IBAction func SendData(sender: AnyObject) {
        var stadiumNameText = stadiumName.text
        var sectionNumberText = sectionNumber.text
        var seatNumberText = seatNumber.text
        
        NSLog("HELLLLO")
        NSLog(stadiumNameText)
        NSLog(sectionNumberText)
        NSLog(seatNumberText)
        
        var serverData = ServerData(stadiumName: stadiumNameText, sectionNumber: sectionNumberText, seatNumber: seatNumberText)
        
        var flash = Flashlight(startTime: serverData.startTime, statusArray: serverData.statusArray)
        flash.getCamera()
        flash.checkStart()
    }
}

