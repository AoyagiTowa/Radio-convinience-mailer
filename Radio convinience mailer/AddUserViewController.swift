//
//  AddUserViewController.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/24.
//

import UIKit

class AddUserViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource,UITextFieldDelegate {
    
    
    @IBOutlet var radioNameField: UITextField!
    @IBOutlet var radioAgeField: UITextField!
    @IBOutlet var radioRegionField: UITextField!
    @IBOutlet var jenderField: UITextField!
    @IBOutlet var saveButton: UIButton!
    var pickerView: UIPickerView = UIPickerView()
    let saveData: UserDefaults = UserDefaults.standard
    
    let jenderList = ["男性","女性","非公開"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        radioNameField.delegate = self
        radioAgeField.delegate = self
        radioRegionField.delegate = self
        hideKeyboardWhenTappedAround()
        
        let toolbar_jender = UIToolbar(frame: CGRectMake(0, 0, view.frame.size.width, 35))
        let toolbar_age = UIToolbar(frame: CGRectMake(0, 0, view.frame.size.width, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddUserViewController.done))
        let doneItem_age = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(AddUserViewController.done_age))
        toolbar_jender.setItems([doneItem], animated: true)
        toolbar_age.setItems([doneItem_age], animated: true)
        
        
        
        saveButton.layer.cornerRadius = 16
        radioNameField.text = saveData.string(forKey: "ラジオネーム")
        radioAgeField.text = saveData.string(forKey: "年齢")
        radioRegionField.text = saveData.string(forKey: "居住区")
        jenderField.text = saveData.string(forKey: "性別")
        
        
        self.jenderField.inputView = pickerView
        self.jenderField.inputAccessoryView = toolbar_jender
        self.radioAgeField.inputAccessoryView = toolbar_age
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
 
  
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    //プルダウンメニューを作る処理
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return jenderList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return jenderList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.jenderField.text = jenderList[row]
    }
    
    func cancel() {
        self.jenderField.text = ""
        self.jenderField.endEditing(true)
    }
    
    @objc func done() {
        self.jenderField.endEditing(true)
        self.jenderField.text = "\(jenderList[pickerView.selectedRow(inComponent: 0)])"
    }
    @objc func done_age() {
        self.radioAgeField.endEditing(true)
    }
    
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startApplication() {
        if radioNameField.text == nil {
            return
        }
        saveData.set(radioNameField.text, forKey: "ラジオネーム")
        saveData.set(radioAgeField.text, forKey: "年齢")
        saveData.set(radioRegionField.text, forKey: "居住区")
        saveData.set(jenderField.text, forKey: "性別")
        performSegue(withIdentifier: "main", sender: nil)
        
        
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
