//
//  MainViewController.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet var makeMailButton: UIButton!
    
    let saveData: UserDefaults = UserDefaults.standard
    var radio_array: [RadioClass] = []
    var key_array: [String] = []
    let id = UUID()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        makeMailButton.layer.cornerRadius = 32
        table.dataSource = self
        table.delegate = self
        //ここに何もない時も許容できるようにする
        //key_array = (saveData.object(forKey: "key") as! [String]) ?? []
//        for i in key_array {
//            let radio_value: RadioClass = saveData.object(forKey: i) as! RadioClass
//            radio_array.append(radio_value)
//        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return radio_array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomTableViewCell {
//            cell.viewLoad(name: radio_array[indexPath.row].radioName,address: radio_array[indexPath.row].radioAddress,startTime: radio_array[indexPath.row].radioStart,finishTime: radio_array[indexPath.row].radioStop,isOn: radio_array[indexPath.row].radioDays)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    
    @IBAction func addRadioInfo() {
    }
    
    @IBAction func makeMail() {
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
