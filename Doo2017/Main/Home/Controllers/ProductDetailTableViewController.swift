//
//  ProductDetailTableViewController.swift
//  Doo2017
//
//  Created by Braver Chiang on 10/25/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import UIKit

class ProductDetailTableViewController: UITableViewController {
    
    
    var product: Product?

    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleTextField: UITextField!
    @IBOutlet weak var productDescriptionTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        productImageView.image = product?.image
        productTitleTextField.text = product?.title
//        productTitleTextField.delegate = self as? UITextFieldDelegate
        productDescriptionTextView.text = product?.description
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


}
