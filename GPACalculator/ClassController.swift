//
//  ClassController.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 7/19/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class ClassController: UIViewController, CreditHoursDelegate, GradingScaleDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var className: UITextField!
    var currentClass: Class? {
        didSet {
            self.setHours()
            self.setGrade()
            self.setName()
        }
    }
    var creditHoursController: CreditHoursCollectionController?
    var gradingScaleController: GradingScaleCollectionController?
    
    func setup() {
        if currentClass == nil {
            currentClass = Class()
        }
    }
    
    func setHours() {
        if let hours = currentClass?.creditHours {
            creditHoursController?.selectHours(hours: hours)
        }
    }
    
    func setGrade() {
        if let grade = currentClass?.grade {
            gradingScaleController?.selectGrade(grade: grade)
        }
    }
    
    func setName() {
        self.className?.text = currentClass?.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.className.delegate = self
        setName()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        currentClass?.name = textField.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func emitClassIsReady() {
        if (currentClass?.isValid())! {
            NotificationCenter.default.post(name: .classIsReady, object: nil, userInfo: ["class": currentClass!])
        }
    }
    
    func didSelectCreditHour(controller: CreditHoursCollectionController, creditHours: Double) {
        currentClass?.creditHours = creditHours
        emitClassIsReady()
    }
    
    func didSelectGrade(controller: GradingScaleCollectionController, grade: String) {
        currentClass?.grade = grade
        emitClassIsReady()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "creditHours") {
            let creditHoursController = segue.destination as! CreditHoursCollectionController
            creditHoursController.delegate = self
            self.creditHoursController = creditHoursController
            self.setHours()
        }
        else if (segue.identifier == "gradingScale") {
            let gradingScaleController = segue.destination as! GradingScaleCollectionController
            gradingScaleController.delegate = self
            self.gradingScaleController = gradingScaleController
            self.setGrade()
        }
    }
}
