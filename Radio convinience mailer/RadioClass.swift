//
//  RadioClass.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/24.
//

import UIKit
import RealmSwift

class RadioClass: Object{
    let uuid: UUID = UUID()
    @objc dynamic var radioName: String? = nil
    @objc dynamic var radioAddress: String? = nil
    @objc dynamic var radioDays: [Bool] = []
    @objc dynamic var radioStart: Date? = nil
    @objc dynamic var radioStop: Date? = nil
    
    
}
