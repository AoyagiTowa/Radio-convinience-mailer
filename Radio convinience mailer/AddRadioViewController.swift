//
//  AddRadioViewController.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/24.
//

import UIKit

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
    var key_array: [String] = []
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
    
    @IBAction func retuen() {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func save() {
        if radioNameField == nil ||
            radioAdressField == nil{
            return
        }else {
            //各cellの情報を呼び出す為の鍵を格納しているString型の配列を呼び出す処理
            if saveData.object(forKey: "key") as? [String] != nil {
                key_array = (saveData.object(forKey: "key") as? [String])!
            }
            
            weekdaysBool = [mondaySwitch.isOn,tuesdaySwitch.isOn,wednesdaySwitch.isOn,tursdaySwitch.isOn,fridaySwitch.isOn,saturdaySwitch.isOn,sundaySwitch.isOn]
            
            //オリジナルクラスのRadioClassのインスタンスに、それぞれ値を代入する
            radioClass = RadioClass.init(radioName: radioNameField.text!, radioAddress: radioAdressField.text!, radioDays: weekdaysBool, radioStart: startTimePicker.date, radioStop: finishTimePIcker.date)
            
            //ここでkey_arrayにappendできていない。radioNameField.textは出力できる。
//            for i in key_array {
//                if i == radioNameField.text!{
//                    break
//                }else {
//                    key_array.append(radioNameField.text!)
//                }
//            }
            key_array.append(radioNameField.text!)

            
            print(key_array)
            //encodeの処理部分のメソッド呼び出し
            saveRadio(radio: radioClass, key_array: key_array)
            //saveData.set("bananamoon", forKey: "key")
        }
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    //ここのメソッドで処理。encodeしたオリジナルクラスをとりあえずテストとして、番組名を鍵に保存し、鍵の番組名の配列をkeyという鍵で保存する。
    func saveRadio(radio: RadioClass, key_array: [String]) {
        let data = try? JSONEncoder().encode(radio)
        saveData.set(data, forKey: radio.radioName)
        saveData.set(key_array, forKey: "key")
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

