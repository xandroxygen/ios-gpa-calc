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
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return creditHours.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> CreditHoursCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! CreditHoursCollectionViewCell
        cell.scaleCellView.label.text = "\(creditHours[indexPath[1]])"
        return cell
    }
    
}
