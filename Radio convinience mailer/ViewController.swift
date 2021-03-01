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
    let mailList = ["banana@tbs.co.jp","nogizaka@allnightnippon.com","megane@tbs.co.jp"]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendMail()
        pickerView.delegate = self
        pickerView.dataSource = self
        self.senderAdressField.inputView = pickerView
        // Do any additional setup after loading the view.
    }
    
    @IBAction func send(){
        
    }
    func sendMail() {
        if contentField.text == nil ||
            senderAdressField == nil ||
            mainTitleField == nil {
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
            mail.setSubject(contentField.text!)
            //メッセージ本文
            //ここに、ユーザー情報を入力(ラジネームなど)。ただし、改行のやり方は不明。要調査
            mail.setMessageBody("テストメール", isHTML: false)
            //メールを表示
            self.present(mail, animated: true, completion: nil)
            
            //メール送信が不可能なら
        } else {
            //アラートで通知
            let alert = UIAlertController(title: "No Mail Accounts", message: "Please set up mail accounts", preferredStyle: .alert)
            let dismiss = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(dismiss)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //エラー処理
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if error != nil {
            //送信失敗
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
    
    
    
}

