//
//  OnBoardingStepsViewController.swift
//  Transaciones
//
//  Created by Luis on 2/21/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit

class OnBoardingStepsViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    public var item: OnBoardingItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = item?.title
        descriptionLabel.text = item?.description
        image.image = UIImage( named: item?.image ?? "" )
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
