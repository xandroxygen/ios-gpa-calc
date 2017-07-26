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
                                 cellForItemAt indexPath: IndexPath) -> ScaleViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! ScaleViewCell
        let label = cell.contentView.subviews[0] as! UILabel
        label.text = "\(creditHours[indexPath.row])"
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Hours: \(creditHours[indexPath.row])")
    }
}

