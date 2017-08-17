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
    weak var delegate: AddClassDelegate?
    var student: Student?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        student = Student()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: .classIsReady, object: nil, queue: nil, using: updateGPA)
    }
    
    func updateGPA(notification: Notification) {
        projectedGPA.text = String(format: "%.2f", (student?.projectGPA())!)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "classList" {
            if let destination = segue.destination as? ClassListViewController {
                delegate = destination
                destination.student = self.student
                destination.setup()
            }
        }
    }

    @IBAction func addClass(_ sender: Any) {
        delegate?.didAddClass()
    }
}

protocol AddClassDelegate: class {
    func didAddClass()
}

extension Notification.Name {
    static let classIsReady = Notification.Name("classIsReady")
}
