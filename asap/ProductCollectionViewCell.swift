//
//  ProductCollectionViewCell.swift
//  asap
//
//  Created by liusy182 on 30/4/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet var modelLabel: UILabel! {
        didSet {
            modelLabel.font = UIFont.latoFontOfSize(18)
        }
    }
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.latoFontOfSize(18)
        }
    }
    
    @IBOutlet var priceLabel: UILabel! {
        didSet {
            priceLabel.font = UIFont.latoBoldFontOfSize(18)
        }
    }
}
