//
//  CreditHoursControllerCollectionViewController.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 7/19/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class CreditHoursCollectionController: UICollectionViewController {

    fileprivate let reuseIdentifier = "CreditHour"
    fileprivate var creditHours = [5, 4, 3, 2, 1, 0.5]
    weak var delegate: CreditHoursDelegate?
    
    func selectHours(hours: Double) {
        let path = IndexPath(row: creditHours.index(of: hours)!, section: 0)
        self.collectionView?.selectItem(at: path, animated: false, scrollPosition: .centeredHorizontally)
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return creditHours.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> ScaleViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! ScaleViewCell
        let label = cell.contentView.subviews[0] as! UILabel
        label.text = "\(creditHours[indexPath.row])"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCreditHour(controller: self, creditHours: creditHours[indexPath.row])
    }
}

protocol CreditHoursDelegate: class {
    func didSelectCreditHour(controller: CreditHoursCollectionController, creditHours: Double)
}

