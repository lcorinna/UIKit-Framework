//
//  PageViewController.swift
//  lesson 8
//
//  Created by Lashaun Corinna on 12/16/22.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let presenrScreenContent = ["We are throwing dust in the eyes about the usefulness of our application",
                                "We pour water to confirm the first slide",
                                "Congratulations you can take a closer look at a piece of dirt",
                                "Alas, this is reality, it remains only to move away from the shock and accept"]
    
    let emojiArray = ["🌇", "🌊", "🌋", "😨"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let contentViewController = showViewControllerAtIndex(0) {
            setViewControllers([contentViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    func showViewControllerAtIndex(_ index: Int) -> ContentViewController? {
        
        guard index >= 0 else { return nil }
        guard index < presenrScreenContent.count else { return nil }
        guard let contentViewController = storyboard?.instantiateViewController(withIdentifier: "ContentViewController") as? ContentViewController else { return nil }
        
        if index == (presenrScreenContent.count - 1) {
            contentViewController.hiddenButton = true
        }
        
        contentViewController.presentText = presenrScreenContent[index]
        contentViewController.emoji = emojiArray[index]
        contentViewController.currentPage = index
        contentViewController.numberOfPage = (presenrScreenContent.count + 1)
        
        return contentViewController
    }
}


extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber -= 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var pageNumber = (viewController as! ContentViewController).currentPage
        pageNumber += 1
        
        return showViewControllerAtIndex(pageNumber)
    }
    
    
}
