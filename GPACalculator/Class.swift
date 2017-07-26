//
//  Class.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 7/26/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class Class {
    var creditHours: Double?
    var grade: String?
    var name: String?
    
    func isValid() -> Bool {
        return creditHours != nil && grade != nil
    }
}
