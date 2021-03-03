//
//  RadioClass.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/24.
//

import UIKit
import Foundation.NSObject

class RadioClass: NSObject, NSCoding {
    var primaryKey: String
    var radioName: String
    var radioAddress: String
    var radioDays: Array<Bool> = Array(repeating: false, count: 7)
    var radioStart: Date
    var radioStop: Date
    
    init(primaryKey: String, radioName: String,radioAddress: String,radioDays: [Bool], radioStart: Date,radioStop: Date) {
        self.primaryKey = primaryKey
        self.radioName = radioName
        self.radioAddress = radioAddress
        self.radioDays = radioDays
        self.radioStart = radioStart
        self.radioStop = radioStop
    }
    
    required init?(coder: NSCoder) {
        primaryKey = (coder.decodeObject(forKey: "primaryKey") as? String) ?? ""
        radioName = (coder.decodeObject(forKey: "radioName") as? String) ?? ""
        radioAddress = (coder.decodeObject(forKey: "radioAddress") as? String) ?? ""
        radioDays = coder.decodeObject(forKey: "radioDays") as! Array<Bool>
        radioStart = coder.decodeObject(forKey: "radioStart") as! Date
        radioStop = coder.decodeObject(forKey: "radioStop") as! Date
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(primaryKey, forKey: "primaryKey")
        coder.encode(radioName, forKey: "radioName")
        coder.encode(radioAddress, forKey: "radioAddress")
        coder.encode(radioDays, forKey: "radioDays")
        coder.encode(radioStart, forKey: "radioStart")
        coder.encode(radioStop, forKey: "radioStop")
    }

}
