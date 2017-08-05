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
    var currentClass: Class?
    
    func setup() {
        if currentClass == nil {
            currentClass = Class()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.className.delegate = self
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
        }
        else if (segue.identifier == "gradingScale") {
            let gradingScaleController = segue.destination as! GradingScaleCollectionController
            gradingScaleController.delegate = self
        }
    }
}
