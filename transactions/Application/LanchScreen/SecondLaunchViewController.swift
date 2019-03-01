//
//  SecondLaunchViewController.swift
//  transactions
//
//  Created by Luis on 2/28/19.
//  Copyright © 2019 websapp. All rights reserved.
//

import UIKit
import Lottie
import Firebase
import FirebaseAuth

class SecondLaunchViewController: UIViewController {

    let loadView = LOTAnimationView(name: "load")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView.frame = CGRect(x: self.view.frame.width / 2 - 75 , y: self.view.frame.height - 250  , width: 150, height: 150)
        loadView.contentMode = .scaleAspectFill
        loadView.loopAnimation = true
        self.view.addSubview(loadView)
        loadView.play()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7 ) {
            self.loadData()
        }
    }
    
    
    private func loadData(){
        
        
        let onboaring = UserDefaults.standard.value(forKey: "WatchedOnboarding") as? Bool ?? false
        if !onboaring  {
            
            //OnBoarding
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "OnBoarding", bundle: nil )
            let loginView = mainStoryBoard.instantiateViewController(withIdentifier: "OnBoarding") as! OnBoardingContainerViewController
            present(loginView, animated: true, completion: nil )
            
        } else {
            
            let session = UserDefaults.standard.value(forKey: "WatcheLogin") as? Bool ?? false
            if session {
                
                let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil )
                let loginView = mainStoryBoard.instantiateViewController(withIdentifier: "Main") as! TabBarViewController
                present(loginView, animated: true, completion: nil )

            } else {
                
                let mainStoryBoard: UIStoryboard = UIStoryboard(name: "SignIn", bundle: nil )
                let loginView = mainStoryBoard.instantiateViewController(withIdentifier: "SignIn") as! SignInViewController
                present(loginView, animated: true, completion: nil )
                
            }
  
            
        }
    }


}
