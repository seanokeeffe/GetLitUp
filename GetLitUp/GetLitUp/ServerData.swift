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
        
        var start:Double = 0
        var statusArray:[Int] = [1,1,0,1,1,1,0,1,1,1,0,0,1,1]
        
        self.startTime = start
        self.statusArray = statusArray
    }
}