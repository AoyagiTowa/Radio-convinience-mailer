//
//  RadioClass.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/24.
//

import UIKit

class RadioClass {
    let uuid = UUID()
    var radioName: String
    var radioAddress: String
    var radioDays: Array<Bool> = Array(repeating: false, count: 7)
    var radioStart: Date
    var radioStop: Date
    
    init(radioName: String,radioAddress: String,radioDays: [Bool], radioStart: Date,radioStop: Date) {
        self.radioName = radioName
        self.radioAddress = radioAddress
        self.radioDays = radioDays
        self.radioStart = radioStart
        self.radioStop = radioStop
    }
}
