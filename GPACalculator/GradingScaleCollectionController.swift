//
//  GradingScaleCollectionController.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 7/25/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class GradingScaleCollectionController: UICollectionViewController {
    
    fileprivate let reuseIdentifier = "Grade"
    fileprivate var gradingScale = ["A", "A-", "B+", "B", "B-", "C+", "C", "C-", "D+", "D", "D-", "E"]
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return gradingScale.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> GradingScaleCollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! GradingScaleCollectionViewCell
        cell.scaleCellView.label.text = gradingScale[indexPath[1]]
        return cell
    }
}
