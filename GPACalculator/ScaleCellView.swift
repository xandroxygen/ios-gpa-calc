//
//  ScaleCellView.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 7/25/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class ScaleCellView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var label: UILabel!
    
    func setup() {
        Bundle.main.loadNibNamed("ScaleCellView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
}
