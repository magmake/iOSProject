//
//  CollectionViewCell.swift
//  StrawberryPie
//
//  Created by iosdev on 25/11/2019.
//  Copyright © 2019 Team Työkkäri. All rights reserved.
//
// Just a simple class to inialize name label and imageview for Collection view cells

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
}
