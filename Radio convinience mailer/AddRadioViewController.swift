//
//  AddRadioViewController.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/24.
//

import UIKit
import RealmSwift

class AddRadioViewController: UIViewController {
    
    @IBOutlet var radioNameField: UITextField!
    @IBOutlet var radioAdressField: UITextField!
    @IBOutlet var mondaySwitch: UISwitch!
    @IBOutlet var tuesdaySwitch: UISwitch!
    @IBOutlet var wednesdaySwitch: UISwitch!
    @IBOutlet var tursdaySwitch: UISwitch!
    @IBOutlet var fridaySwitch: UISwitch!
    @IBOutlet var saturdaySwitch: UISwitch!
    @IBOutlet var sundaySwitch: UISwitch!
    @IBOutlet var startTimePicker: UIDatePicker!
    @IBOutlet var finishTimePIcker: UIDatePicker!
    var radioClass: RadioClass!
    var weekdaysBool:Array<Bool> = Array(repeating: false, count: 7)
    let saveData: UserDefaults = UserDefaults.standard
    let uuid = UUID()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimePicker.preferredDatePickerStyle = .wheels
        startTimePicker.timeZone = NSTimeZone.local
        startTimePicker.datePickerMode = .time
        startTimePicker.locale = Locale(identifier: "ja_JP")
        finishTimePIcker.preferredDatePickerStyle = .wheels
        finishTimePIcker.timeZone = NSTimeZone.local
        finishTimePIcker.datePickerMode = .time
        finishTimePIcker.locale = Locale(identifier: "ja_JP")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func save() {
        if radioNameField == nil {
            return
        }
        if radioAdressField == nil {
            return
        }
        weekdaysBool = [mondaySwitch.isOn,tuesdaySwitch.isOn,wednesdaySwitch.isOn,tursdaySwitch.isOn,fridaySwitch.isOn,saturdaySwitch.isOn,sundaySwitch.isOn]
        
        radioClass = RadioClass.init(radioName: radioNameField.text!, radioAddress: radioAdressField.text!, radioDays: weekdaysBool, radioStart: startTimePicker.date, radioStop: finishTimePIcker.date)
        
        //ここが上手くかない、多分UUIDが変
        saveData.set(radioClass, forKey: "\(radioClass.uuid)")
        saveData.set("\(radioClass.uuid)", forKey: "key")
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
