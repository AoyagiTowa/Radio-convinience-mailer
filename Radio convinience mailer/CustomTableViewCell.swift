//
//  CustomTableViewCell.swift
//  Radio convinience mailer
//
//  Created by Towa Aoyagi on 2021/03/01.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
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
    @IBOutlet var view: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        view.layer.cornerRadius = 24
        view.clipsToBounds = true

        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func viewRoad(name: String, address: String, startTime: Date, finishTime: Date, isOn: [Bool]) {
        radioNameLabel.text = name
        radioAdressLabel.text = address
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        radioStartTimeLabel.text = formatter.string(from: startTime)
        radioStopTimeLabel.text = formatter.string(from: finishTime)
        if isOn[0] == true {
            mondayLabel.textColor = UIColor.systemBlue
        }
        if isOn[1] {
            tuesdayLabel.textColor = UIColor.systemBlue
        }
        if isOn[2] {
            wednesdayLabel.textColor = UIColor.systemBlue
        }
        if isOn[3] {
            tursdayLabel.textColor = UIColor.systemBlue
        }
        if isOn[4] {
            fridayLabel.textColor = UIColor.systemBlue
        }
        if isOn[5] {
            saturdayLabel.textColor = UIColor.systemBlue
        }
        if isOn[6] {
            sundayLabel.textColor = UIColor.systemBlue
        }
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0))
    }
    
}
