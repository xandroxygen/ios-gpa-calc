//
//destination.currentClass?.name ?? ""ClassListViewController.swift
//  GPACalculator
//
//  Created by Xander Moffatt on 8/14/17.
//  Copyright © 2017 Xander Moffatt. All rights reserved.
//

import UIKit

class ClassListViewController: UIViewController, EMPageViewControllerDataSource, EMPageViewControllerDelegate, AddClassDelegate {
    
    var student: Student?
    var pageViewController: EMPageViewController?

    func setup() {
        let pageViewController = EMPageViewController()
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        let currentViewController = self.viewController(at: 0)!
        pageViewController.selectViewController(currentViewController, direction: .forward, animated: false, completion: nil)
        
        self.addChildViewController(pageViewController)
        self.view.insertSubview(pageViewController.view, at: 0)
        pageViewController.didMove(toParentViewController: self)
        self.pageViewController = pageViewController
    }
    
    // MARK: Add Class Delegate
    
    func didAddClass() {
        student?.classes.append(Class())
        let currentViewController = self.viewController(at: (self.student?.classes.count)! - 1)
        self.pageViewController!.selectViewController(currentViewController!, direction: .forward, animated: true, completion: nil)
    }
    
    // MARK: EMPageViewController Data Source
    
    func viewController(at index: Int) -> ClassController? {
        let classCount = self.student?.classes.count ?? 0
        if (classCount == 0 || (index < 0) || (index >= classCount)) {
            return nil
        }
        
        let viewController = self.storyboard!.instantiateViewController(withIdentifier: "ClassController") as! ClassController
        viewController.currentClass = self.student?.classes[index]
        return viewController
    }
    
    func index(of viewController: ClassController) -> Int? {
        if let currentClass: Class = viewController.currentClass {
            return self.student?.classes.index(of: currentClass)
        } else {
            return nil
        }
    }
    
    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.index(of: viewController as! ClassController) {
            let beforeViewController = self.viewController(at: viewControllerIndex - 1)
            return beforeViewController
        } else {
            return nil
        }
    }

    func em_pageViewController(_ pageViewController: EMPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if let viewControllerIndex = self.index(of: viewController as! ClassController) {
            let afterViewController = self.viewController(at: viewControllerIndex + 1)
            return afterViewController
        } else {
            return nil
        }
    }
    
    // MARK: EMPageViewController Delegate
    
    func em_pageViewController(_ pageViewController: EMPageViewController, willStartScrollingFrom startingViewController: UIViewController, destinationViewController: UIViewController) {
        
        let start = startingViewController as! ClassController
        let destination = destinationViewController as! ClassController
        
        print("Will start scrolling from \(start.currentClass?.name ?? "") to \(destination.currentClass?.name ?? "")")
    }
    
    func em_pageViewController(_ pageViewController: EMPageViewController, isScrollingFrom startingViewController: UIViewController, destinationViewController: UIViewController, progress: CGFloat) {
        
        let start = startingViewController as! ClassController
        let destination = destinationViewController as! ClassController
        
        print("Is scrolling from \(start.currentClass?.name ?? "") to \(destination.currentClass?.name ?? "") with progress '\(progress)'.")
    }
    
    func em_pageViewController(_ pageViewController: EMPageViewController, didFinishScrollingFrom startingViewController: UIViewController?, destinationViewController: UIViewController, transitionSuccessful: Bool) {
        
        let start = startingViewController as! ClassController?
        let destination = destinationViewController as! ClassController
        
        print("Finished scrolling from \(start?.currentClass?.name ?? "") to \(destination.currentClass?.name ?? ""). Transition successful? \(transitionSuccessful)")
    }
}

