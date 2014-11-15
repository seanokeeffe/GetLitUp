//
//  ServerData.swift
//  GetLitUp
//
//  Created by CS121 on 11/14/14.
//  Copyright (c) 2014 Hack. All rights reserved.
//

import Foundation

class ServerData {
    
    let stadiumName:String
    let sectionNumber:String
    let seatNumber: String
    
    var startTime:Double
    var statusArray:[Int]


    init(stadiumName: String, sectionNumber: String, seatNumber: String) {
        self.stadiumName = stadiumName
        self.sectionNumber = sectionNumber
        self.seatNumber = seatNumber
        
        var dataGenerator = DataGenerator(AtStadium: stadiumName, InSection: sectionNumber, ForSeat: seatNumber)
        sleep(4)
        NSLog("GOT PAST SLEEP")
        
        var start:Double = dataGenerator.getStartTime()
        var statusArray:[Int] = dataGenerator.getStatusArray()
        
        NSLog("Past making arrays")
        
        
        
        self.startTime = start
        self.statusArray = statusArray
    }
}