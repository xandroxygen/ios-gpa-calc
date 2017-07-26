//
//  MainController.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 6/14/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    @IBOutlet weak var projectedGPA: UILabel!
    var gradingScale: [String: Double] = ["A": 4.0, "A-": 3.7, "B+": 3.4, "B": 3.0, "B-": 2.7, "C+": 2.4, "C": 2.0, "C-": 1.7, "D+": 1.4, "D": 1.0, "D-": 0.7, "E": 0.0]
    var classes: [Class] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .classIsReady, object: nil, queue: nil, using: catchClassIsReady)
    }
    
    func updateGPA() {
        var totalHours = 0.0
        var totalPoints = 0.0
        for c in classes {
            totalHours += c.creditHours!
            totalPoints += gradingScale[c.grade!]! * c.creditHours!
        }
        projectedGPA.text = String(format: "%.2f", totalPoints / totalHours)
    }
    
    func catchClassIsReady(notification: Notification) {
        guard let currentClass = notification.userInfo!["class"] as! Class? else { return }
        classes.append(currentClass)
        updateGPA()
    }

}

extension Notification.Name {
    static let classIsReady = Notification.Name("classIsReady")
}
