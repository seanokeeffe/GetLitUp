//
//  Flashlight.swift
//  GetLitUp
//
//  Created by CS121 on 11/14/14.
//  Copyright (c) 2014 Hack. All rights reserved.
//

import Foundation
import AVFoundation

class Flashlight {
    
    var currentPos: Int
    var startTime: Double
    var statusArray: [Int]
    
    let offError: NSErrorPointer
    let onError: NSErrorPointer
    
    let flashlight:AVCaptureDevice = AVCaptureDevice()
    
    init(startTime: Double, statusArray: [Int] ) {
        self.currentPos = 0
        self.startTime = startTime
        self.statusArray = statusArray
        
        self.onError = NSErrorPointer()
        self.offError = NSErrorPointer()
    }
    
    func checkStart() {
        if currentPos >= statusArray.count {
            return
        }
        
        var currentTime = NSDate().timeIntervalSince1970
        while startTime < currentTime {
            sleep(1)
        }
        
        checkFlashlightStatus()
    }
    
    func checkFlashlightStatus() {

        if statusArray[currentPos] == 1 {
            flashlight.setTorchModeOnWithLevel(AVCaptureMaxAvailableTorchLevel, error: onError)
            currentPos += 1
        }
        else {
            flashlight.setTorchModeOnWithLevel(0, error: offError)
            currentPos += 1
        }
        startTime += 1
        checkStart()
    }
}
