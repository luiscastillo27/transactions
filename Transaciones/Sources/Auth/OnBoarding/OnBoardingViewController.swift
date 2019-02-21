//
//  OnBoardingViewController.swift
//  Transaciones
//
//  Created by Luis on 2/21/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {

    @IBOutlet weak var pageController: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "openOnBoarding",
            let destination = segue.destination as? PageOnBoardingViewController else {
                return
        }
        
        destination.pageController = pageController
    }
}
