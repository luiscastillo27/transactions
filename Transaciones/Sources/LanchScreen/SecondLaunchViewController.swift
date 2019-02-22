//
//  SecondLaunchViewController.swift
//  Transaciones
//
//  Created by Luis on 2/22/19.
//  Copyright © 2019 Luis. All rights reserved.
//

import UIKit
import Lottie

class SecondLaunchViewController: UIViewController {

    let loadView = LOTAnimationView(name: "loading")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView.frame = CGRect(x: self.view.frame.width / 2 - 75 , y: self.view.frame.height - 250  , width: 150, height: 150)
        loadView.contentMode = .scaleAspectFill
        loadView.loopAnimation = true
        self.view.addSubview(loadView)
        loadView.play()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) {
            self.loadData()
        }
    }
    
    
    private func loadData(){
            let onBoarding:String = UserDefaults.standard.string(forKey: "onBoarding") ?? ""
            if onBoarding == "" {
                
                //OnBoarding
                let mainStoryBoard: UIStoryboard = UIStoryboard(name: "OnBoarding", bundle: nil )
                let loginView = mainStoryBoard.instantiateViewController(withIdentifier: "OnBoarding") as! OnBoardingContainerViewController
                present(loginView, animated: true, completion: nil )
                
            } else {
                
                //Auth
                let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Auth", bundle: nil )
                let loginView = mainStoryBoard.instantiateViewController(withIdentifier: "Auth") as! AuthViewController
                present(loginView, animated: true, completion: nil )
                
                //main
                //let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil )
                //let loginView = mainStoryBoard.instantiateViewController(withIdentifier: "Main") as! TabBarViewController
                //present(loginView, animated: true, completion: nil )

            }
    }


}
