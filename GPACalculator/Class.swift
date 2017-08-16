//
//  Class.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 7/26/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class Class: Equatable {
    var creditHours: Double?
    var grade: String?
    var name: String?
    private var id: Int
    static var num: Int = 0
    
    init() {
        id = Class.num
        Class.num += 1
    }
    
    func isValid() -> Bool {
        return creditHours != nil && grade != nil
    }
    
    static func ==(lhs: Class, rhs: Class) -> Bool {
        return lhs.id == rhs.id
    }
}
