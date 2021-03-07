//
//  FirstControllView.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/03/07.
//

import UIKit

class FirstViewController: UIViewController {
    let saveData: UserDefaults = UserDefaults.standard
    var bool: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bool = saveData.bool(forKey: "only")
        if bool == true{
            self.performSegue(withIdentifier: "first", sender: nil)
            bool = false
            saveData.set(bool, forKey: "only")
            
        }else{
            self.performSegue(withIdentifier: "next", sender: nil)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
}
