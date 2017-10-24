//
//  ProductTableViewCell.swift
//  Doo2017
//
//  Created by Braver Chiang on 10/25/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    
    var product: Product? {
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        productImageView.image = product?.image
        productTitleLabel.text = product?.title
        productDescriptionLabel.text = product?.description
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
