//
//  ClassController.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 7/19/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class ClassController: UIViewController, CreditHoursDelegate, GradingScaleDelegate {
    
    var currentClass: Class?
    
    func setup() {
        if currentClass == nil {
            currentClass = Class()
        }
    }
    
    func emitClassIsReady() {
        if (currentClass?.isValid())! {
            NotificationCenter.default.post(name: .classIsReady, object: nil, userInfo: ["class": currentClass!])
        }
    }
    
    func didSelectCreditHour(controller: CreditHoursCollectionController, creditHours: Double) {
        setup()
        currentClass?.creditHours = creditHours
        emitClassIsReady()
    }
    
    func didSelectGrade(controller: GradingScaleCollectionController, grade: String) {
        setup()
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
