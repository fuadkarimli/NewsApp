//
//  TableViewCell.swift
//  NewsApp-Swift
//
//  Created by Fuad Karimli on 4/16/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelNews: UILabel!
    
    @IBOutlet weak var labelDesc: UILabel!
    
    @IBOutlet weak var imageNews: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
