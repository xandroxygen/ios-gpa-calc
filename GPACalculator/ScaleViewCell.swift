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
        selectedBackgroundView = renderBackground(true)
        backgroundView = renderBackground(false)
    }
    
    func renderBackground(_ selected: Bool) -> UIView {
        let view = UIView()
        let selectedColor = UIColor(red:0.00, green:0.50, blue:1.00, alpha:1.0)
        view.backgroundColor = selected ? selectedColor : UIColor.white
        if (selected) {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 4, height: 4))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            view.layer.mask = mask
        }
        else {
            view.layer.cornerRadius = 4
            view.layer.borderWidth = 2
            view.layer.borderColor = selectedColor.cgColor
        }
        return view
    }
    
    override func awakeFromNib() {
        setup()
    }
}
