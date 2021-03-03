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
    var weekdaysBool:[Bool]!
    let saveData: UserDefaults = UserDefaults.standard
    
    
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
        
        let realm = try! Realm()

        if radioNameField == nil {
            return
        }
        if radioAdressField == nil {
            return
        }
        weekdaysBool = [mondaySwitch.isOn,tuesdaySwitch.isOn,wednesdaySwitch.isOn,tursdaySwitch.isOn,fridaySwitch.isOn,saturdaySwitch.isOn,sundaySwitch.isOn]
        
        let radioClass = RadioClass()
        radioClass.radioName = radioNameField.text!
        radioClass.radioAddress = radioAdressField.text!
        radioClass.radioDays = weekdaysBool
        radioClass.radioStart = startTimePicker.date
        radioClass.radioStop = finishTimePIcker.date
    
        //ここが上手くかない、多分UUIDが変
        try! realm.write{
            realm.add(radioClass)
        }
        
        
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
