//
//  ViewController.swift
//  HappyStore
//
//  Created by Mahmoud El-Naggar on 3/28/18.
//  Copyright © 2018 Mahmoud El-Naggar. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class LoginViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet weak var emailEditField: UITextField!
    
    @IBOutlet weak var passwordEditField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    let loginViewModel = LoginViewModel()
    
    @IBAction func onLogin(_ sender: Any) {
        
        loginViewModel.login().subscribe(onNext: { loginResponse in
            
        }, onError: { error in
            
        }, onCompleted: {
            
        }) {
            
        }.disposed(by: disposeBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = emailEditField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.emailText)
        _ = passwordEditField.rx.text.map { $0 ?? ""}.bind(to: loginViewModel.passwordText)
        _ = loginViewModel.isValid.bind(to: loginButton.rx.isEnabled)
        
        _ = loginViewModel.isValid.subscribe(onNext : { [unowned self ] isValid in
            print(isValid)
            self.loginButton.backgroundColor = isValid ? UIColor.blue : UIColor.darkGray
        })
    }
}

