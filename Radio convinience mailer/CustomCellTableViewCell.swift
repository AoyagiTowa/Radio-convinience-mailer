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
    
    func Viewroad() {
        radioNameLabel.text = "ラジオタイトル"
        radioAdressLabel.text = "xxxx.zzzzz@yyy.com"
        radioStartTimeLabel.text = "23:00"
        radioStopTimeLabel.text = "27:00"
        mondayLabel.textColor = UIColor.gray
        tuesdayLabel.textColor = UIColor.gray
        wednesdayLabel.textColor = UIColor.gray
        tursdayLabel.textColor = UIColor.red
        fridayLabel.textColor = UIColor.gray
        saturdayLabel.textColor = UIColor.gray
        sundayLabel.textColor = UIColor.gray

    }
    
}
