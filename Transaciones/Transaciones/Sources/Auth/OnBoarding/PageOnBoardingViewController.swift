//
//  PageOnBoardingViewController.swift
//  Transaciones
//
//  Created by Luis on 2/21/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

struct OnBoardingItem {
    let title:String
    let description:String
    let image:String
}

class PageOnBoardingViewController: UIPageViewController {

    var pageController: UIPageControl?
    fileprivate(set) lazy var items:[OnBoardingItem] = {
        return [
            OnBoardingItem(title: "Save mony and reduce debit", description: "Press the start button", image: "OnBoarding1"),
            OnBoardingItem(title: "You've finished yout onboarding", description:  "Press the start button", image: "OnBoarding2")
        ]
    }()
    
    fileprivate(set) lazy var contentViewController: [UIViewController] = {
        var items = [UIViewController]()
        for i in 0 ..< self.items.count {
            items.append(self.instanceViewController(index: i))
        }
        return items
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        pageController?.numberOfPages = items.count
    }
    
    private func updateContainterView( index:Int ){
        setViewControllers([contentViewController[index]], direction: .forward, animated: true, completion: nil)
    }
    
    private func instanceViewController( index:Int ) -> UIViewController {
        guard let viewController = UIStoryboard(name: "OnBoarding", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnBoardingSteps") as? OnBoardingStepsViewController else {
            return UIViewController()
        }
        viewController.item = items[index]
        return viewController
    }


}


extension PageOnBoardingViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.index(of: viewController)
        if index == 0 {
            return nil
        }
        return contentViewController[index! + 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let index = contentViewController.index(of: viewController)
        if index == contentViewController.count - 1 {
            return nil
        }
        return contentViewController[index! + 1]
    }
    
}

extension PageOnBoardingViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard  let index = contentViewController.index(of: viewControllers!.first!) else {
            return
        }
        pageController?.currentPage = index
    }
    
}
