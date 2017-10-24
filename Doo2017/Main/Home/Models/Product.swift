//
//  Product.swift
//  Doo2017
//
//  Created by Braver Chiang on 10/24/17.
//  Copyright © 2017 Braver Chiang. All rights reserved.
//

import Foundation
import UIKit

enum ProductRating {
    case unrated
    case average
    case ok
    case good
    case brilliant
}

class Product{
    
    var image: UIImage
    var title: String
    var description: String
    var rating: ProductRating
    
    init(titled: String, description: String, imageName: String) {
        self.title = titled
        self.description = description
        if let image = UIImage(named: imageName) {
            self.image = image
        }else{
            self.image = UIImage(named: "default")!
        }
        
        self.rating = .unrated
    }
    
}
