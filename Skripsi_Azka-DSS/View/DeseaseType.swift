//
//  DeseaseType.swift
//  Skripsi_Azka-DSS
//
//  Created by Azka Kusuma Edy on 06/01/23.
//

import UIKit

class DeseaseType: UITableViewCell {

    @IBOutlet weak var deseaseView: UIView!
    @IBOutlet weak var labelDesease: UILabel!
    @IBOutlet weak var imageDesease: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
