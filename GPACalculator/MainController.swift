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
    var student: Student?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .classIsReady, object: nil, queue: nil, using: catchClassIsReady)
        student = Student()
    }
    
    func updateGPA() {
        projectedGPA.text = String(format: "%.2f", (student?.projectGPA())!)
    }
    
    func catchClassIsReady(notification: Notification) {
        guard let currentClass = notification.userInfo!["class"] as! Class? else { return }
        student?.classes.append(currentClass)
        updateGPA()
    }

}

extension Notification.Name {
    static let classIsReady = Notification.Name("classIsReady")
}
