//
//  ViewController.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/22.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate,UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var senderAdressField: UITextField!
    @IBOutlet var mainTitleField: UITextField!
    @IBOutlet var contentField: UITextView!
    var pickerView: UIPickerView = UIPickerView()
    var mailList: [String] = []
    let saveData: UserDefaults = UserDefaults.standard
    var radio_array: [RadioClass] = []
    var key_array: [String] = []
    var userRadioName: String!
    var userAge = ""
    var userRegion = ""
    var userJender = ""
    var senderAddress = ""
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMail()
        pickerView.delegate = self
        pickerView.dataSource = self
        self.senderAdressField.inputView = pickerView
        senderAdressField.layer.cornerRadius = 16
        mainTitleField.layer.cornerRadius = 16
        contentField.layer.cornerRadius = 16
        
        if saveData.object(forKey: "key") as? [String] != nil {
            key_array = saveData.object(forKey: "key") as! [String]
        }
        for i in key_array {
            guard let get_data = saveData.data(forKey: i) else {
                return
            }
            let radio: RadioClass = try! JSONDecoder().decode(RadioClass.self, from: get_data)
            mailList.append(radio.radioAddress)
            radio_array.append(radio)
        }
        
        senderAdressField.text = senderAddress
        userRadioName = saveData.string(forKey: "ラジオネーム")
        userAge = saveData.string(forKey: "年齢")!
        userRegion = saveData.string(forKey: "居住区")!
        userJender = saveData.string(forKey: "性別")!
        contentField.text = """
                ラジオネーム： \(userRadioName!)
                年齢：\(userAge)
                \(userJender)
                \(userRegion)
                """
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func send(){
        sendMail()
    }
    func sendMail() {
        if contentField.text == nil {
            return
        }
        
        if senderAdressField == nil {
            return
        }
        
        if mainTitleField == nil{
            return
        }
        
        //メール送信が可能なら
        if MFMailComposeViewController.canSendMail() {
            //MFMailComposeVCのインスタンス
            let mail = MFMailComposeViewController()
            //MFMailComposeのデリゲート
            mail.mailComposeDelegate = self
            //送り先
            mail.setToRecipients([senderAdressField.text!])
            //件名
            mail.setSubject(mainTitleField.text!)
            //メッセージ本文
            //ここに、ユーザー情報を入力(ラジネームなど)。ただし、改行のやり方は不明。要調査
            mail.setMessageBody(contentField.text!, isHTML: false)
            //メールを表示
            self.present(mail, animated: true, completion: nil)
            print("scucess")
            
            //メール送信が不可能なら
        } else {
            //アラートで通知
            let alert = UIAlertController(title: "No Mail Accounts", message: "Please set up mail accounts", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
            print("fail")
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    //エラー処理
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if error != nil {
            //送信失敗
            print(error)
        } else {
            switch result {
            case .cancelled: break
            //キャンセル
            case .saved: break
            //下書き保存
            case .sent: break
            //送信
            default:
                break
            }
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return mailList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return mailList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.senderAdressField.text = mailList[row]
    }
    
    @IBAction func back(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

