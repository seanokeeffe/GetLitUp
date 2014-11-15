//
//  DataGenerator.swift
//  GetLitUp
//
//  Created by Sean on 11/15/14.
//  Copyright (c) 2014 Hack. All rights reserved.
//

import UIKit
import Foundation


class DataGenerator: NSObject, NSURLConnectionDelegate {
    
    var _stadium: String
    var _section: String
    var _seat: String
    var _ip: String
    var _url: String
    var _startTime: Double?
    var _statusArray: NSArray?
    
    init(AtStadium stadium:String, InSection section: String, ForSeat seat:String) {
        _stadium = stadium
        _section = section
        _seat = seat
        
        _ip = "http://134.173.216.26:5000"
        _url = "\(_ip)/data/\(_stadium)/\(_section)/\(_seat)"
        var convertedString = _url.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
        
        super.init()
        
        self.HTTPGet(convertedString) {
            (data: String, error: String?) -> Void in
            if (error != nil) {
                println(error)
            } else {
                let components = data.componentsSeparatedByString(":") as [NSString]
                self._startTime = components[0].doubleValue
                self._statusArray = components[1].componentsSeparatedByString(",") as [NSString]
            }
        }
        
    }
    
    func getStartTime() -> Double {
        return self._startTime!
    }
    
    func getStatusArray() -> NSArray {
        return self._statusArray!
    }
    
    func HTTPsendRequest(request: NSMutableURLRequest,
        callback: (String, String?) -> Void) {
            let task = NSURLSession.sharedSession()
                .dataTaskWithRequest(request) {
                    (data, response, error) -> Void in
                    if (error != nil) {
                        callback("", error.localizedDescription)
                    } else {
                        callback(NSString(data: data, encoding: NSUTF8StringEncoding)!,nil)
                    }
            }
            
            task.resume()
    }
    
    func HTTPGet(url: String, callback: (String, String?) -> Void) {
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        HTTPsendRequest(request, callback)
    }
    
   
}
