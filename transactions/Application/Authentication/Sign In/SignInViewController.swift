//
//  SignInViewController.swift
//  PlatziFinanzas
//
//  Created by Andres Silva on 12/10/18.
//  Copyright © 2018 Platzi. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD

class SignInViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    private var viewModel = SignInViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loginButton.isEnabled = false
    }
    
    func valid(){
        if emailTextField.text?.count != 0 && passwordTextField.text?.count != 0 {
            loginButton.isEnabled = true
        } else {
            loginButton.isEnabled = false
        }
    }
    
    @IBAction func PasswordChanged(_ sender: UITextField) {
        valid()
    }
    
    @IBAction func EmailChanged(_ sender: UITextField) {
        valid()
    }
    
    @IBAction func signIn(_ sender: UIButton) {
       
        SVProgressHUD.show(withStatus: "Espera...")
        SignInViewModel.signInWith(
            email: emailTextField.text,
            password: passwordTextField.text
        ) { [weak self] (success, error) in

            if let error = error {
                SVProgressHUD.dismiss()
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alert.addAction(ok)
                self?.present(alert, animated: true, completion: nil)
                return
            }

            if success {
                SVProgressHUD.dismiss()
                UserDefaults.standard.set(true, forKey: "WatcheLogin")
                UserDefaults.standard.synchronize()
                self?.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
        
    }
    
    @IBAction func authWithFacebook(_ sender: Any) {
//        SignInViewModel.authWithFacebook(viewController: self) { [weak self] (success, error) in
//            if let error = error {
//                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
//                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
//                alert.addAction(ok)
//                self?.present(alert, animated: true, completion: nil)
//                return
//            }
//
//            if success {
//                self?.performSegue(withIdentifier: "goToMain", sender: self)
//            }
//        }
    }
    
    @IBAction func authWithTwitter(_ sender: Any) {
//        SignInViewModel.authWithTwitter { [weak self] (success, error) in
//            if let error = error {
//                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
//                let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
//                alert.addAction(ok)
//                self?.present(alert, animated: true, completion: nil)
//                return
//            }
//            
//            if success {
//                self?.performSegue(withIdentifier: "goToMain", sender: self)
//            }
//        }
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
