//
//  CustomCellTableViewCell.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/02/28.
//

import UIKit

class CustomCellTableViewCell: UITableViewCell {
    
    @IBOutlet var radioNameLabel: UILabel!
    @IBOutlet var radioAdressLabel: UILabel!
    @IBOutlet var radioStartTimeLabel: UILabel!
    @IBOutlet var radioStopTimeLabel: UILabel!
    @IBOutlet var mondayLabel: UILabel!
    @IBOutlet var tuesdayLabel: UILabel!
    @IBOutlet var wednesdayLabel: UILabel!
    @IBOutlet var tursdayLabel: UILabel!
    @IBOutlet var fridayLabel: UILabel!
    @IBOutlet var saturdayLabel: UILabel!
    @IBOutlet var sundayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func Viewroad(name: String, address: String, startTime: Date, finishTime: Date, isOn: [Bool]) {
        radioNameLabel.text = name
        radioAdressLabel.text = address
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        radioStartTimeLabel.text = formatter.string(from: startTime)
        radioStopTimeLabel.text = formatter.string(from: finishTime)
        if isOn[0] == true {
            mondayLabel.textColor = UIColor.red
        }
        if isOn[1] {
            tuesdayLabel.textColor = UIColor.red
        }
        if isOn[2] {
            wednesdayLabel.textColor = UIColor.red
        }
        if isOn[3] {
            tursdayLabel.textColor = UIColor.red
        }
        if isOn[4] {
            fridayLabel.textColor = UIColor.red
        }
        if isOn[5] {
            saturdayLabel.textColor = UIColor.red
        }
        if isOn[6] {
            sundayLabel.textColor = UIColor.red
        }
        
    }
    
}
