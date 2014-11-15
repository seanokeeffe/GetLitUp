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
    
    var captureDevice : AVCaptureDevice?
    
    var currentTime2 : Double = 1
    
    init(startTime: Double, statusArray: [Int] ) {
        self.currentPos = 0
        self.startTime = startTime
        self.statusArray = statusArray
        
        self.onError = NSErrorPointer()
        self.offError = NSErrorPointer()
    }
    
    func checkStart() {
        for x in 0..<statusArray.count {
            var currentTime = NSDate().timeIntervalSince1970
            var dateFormatter = NSDateFormatter()
            while startTime > currentTime2 {
                sleep(1)
            }
            
            checkFlashlightStatus()
        }
    }
    
    func checkFlashlightStatus() {
        NSLog("IN CHECK")
        if statusArray[currentPos] == 1 {
            NSLog("FLASHON")
            captureDevice?.lockForConfiguration(nil)
            captureDevice?.torchMode = AVCaptureTorchMode.On
            captureDevice?.unlockForConfiguration()
            currentPos += 1
            sleep(1)
        }
        else {
            NSLog("FLASHOFF")
            captureDevice?.lockForConfiguration(nil)
            captureDevice?.torchMode = AVCaptureTorchMode.Off
            captureDevice?.unlockForConfiguration()
            currentPos += 1
            sleep(1)
        }
        startTime += 1
    }
    
    func getCamera() {
        let devices = AVCaptureDevice.devices()
        
        // Loop through all the capture devices on this phone
        for device in devices {
            // Make sure this particular device supports video
            if (device.hasMediaType(AVMediaTypeVideo)) {
                // Finally check the position and confirm we've got the back camera
                if(device.position == AVCaptureDevicePosition.Back) {
                    captureDevice = device as? AVCaptureDevice
                }
            }
        }
    }
}
