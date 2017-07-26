//
//  ScaleViewCell.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 7/25/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class ScaleViewCell: UICollectionViewCell {
    
    func setup() {
        contentView.addSubview({
            let label = UILabel(frame: self.bounds)
            label.textAlignment = .center
            return label
        }())
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor(red:0.00, green:0.50, blue:1.00, alpha:1.0)
        
        backgroundView = UIView()
        backgroundView?.backgroundColor = UIColor.gray
    }
    
    override func awakeFromNib() {
        setup()
    }
}
