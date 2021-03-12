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
        if saveData.object(forKey: "key") as? [String] != nil {
            key_array = saveData.object(forKey: "key") as! [String]
        }
        for i in key_array {
            guard let get_data = saveData.data(forKey: i) else {
                return
            }
            let radio: RadioClass = try! JSONDecoder().decode(RadioClass.self, from: get_data)
            //AddRadioViewControllerでは検証できたので多分大丈夫。
            radio_array.append(radio)
            table.reloadData()
        }
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 110
        table.reloadData()
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        key_array = []
        radio_array = []
        if saveData.object(forKey: "key") as? [String] != nil {
            key_array = saveData.object(forKey: "key") as! [String]
        }
        for i in key_array {
            guard let get_data = saveData.data(forKey: i) else {
                return
            }
            let radio: RadioClass = try! JSONDecoder().decode(RadioClass.self, from: get_data)
            //AddRadioViewControllerでは検証できたので多分大丈夫。
            radio_array.append(radio)
            table.reloadData()
        }
    
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return radio_array.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomTableViewCell {
            //未検証。多分これで表示できると思うが、そもそもデータが取ってこれてない。
            cell.viewRoad(name: radio_array[indexPath.row].radioName, address: radio_array[indexPath.row].radioAddress, startTime: radio_array[indexPath.row].radioStart, finishTime: radio_array[indexPath.row].radioStop, isOn: radio_array[indexPath.row].radioDays)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "mailer") as! ViewController
        nextVC.senderAddress = radio_array[indexPath.row].radioAddress
        navigationController!.pushViewController(nextVC, animated: true)
        
    }
    
    
    
    @IBAction func addRadioInfo() {
    }
    
    @IBAction func makeMail() {
        self.performSegue(withIdentifier: "sendMail", sender: nil)
        
        
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

class SubView: UIView {
    override var bounds: CGRect {
        didSet {
            setupShadow()
        }
    }

    private func setupShadow() {
        self.layer.cornerRadius = 16
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
//        self.layer.shadowRadius = 3
//        self.layer.shadowOpacity = 0.3
//        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}

