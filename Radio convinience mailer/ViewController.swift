//
//  ViewController.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/22.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet var senderAdressField: UITextField!
    @IBOutlet var mainTitleField: UITextField!
    @IBOutlet var contentField: UITextField!



    override func viewDidLoad() {
        super.viewDidLoad()
        sendMail()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func send(){
        
    }
    func sendMail() {
            //メール送信が可能なら
            if MFMailComposeViewController.canSendMail() {
                //MFMailComposeVCのインスタンス
                let mail = MFMailComposeViewController()
                //MFMailComposeのデリゲート
                mail.mailComposeDelegate = self
                //送り先
                mail.setToRecipients(["aoya.tab.dtab@gmail.com"])
                //件名
                mail.setSubject("テスト")
                //メッセージ本文
                mail.setMessageBody("テストメール", isHTML: false)
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
        


}

