//
//  PhotoTableViewCell.swift
//  ImageAPI
//
//  Created by Joy Marie on 11/3/22.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
