//
//  ProfileViewController.swift
//  transactions
//
//  Created by Luis on 2/28/19.
//  Copyright © 2019 websapp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func singOut(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "WatcheLogin")
        UserDefaults.standard.synchronize()
        performSegue(withIdentifier: "goToLogin", sender: self)
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
