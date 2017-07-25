//
//  GradingScaleCollectionViewCell.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 7/25/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class GradingScaleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var scaleCellView: ScaleCellView!
    
    func setup() {
        contentView.addSubview(scaleCellView)
    }
    
    override func awakeFromNib() {
        setup()
    }
}
