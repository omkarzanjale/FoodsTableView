//
//  CustomTableViewCell.swift
//  FoodNavigatorTableView
//
//  Created by Mac on 01/09/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var foodNameLabel : UILabel!
    @IBOutlet weak var HotelNameLabel : UILabel!
    @IBOutlet weak var EditedDataLabel : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
