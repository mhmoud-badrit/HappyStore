//
//  LoginViewModel.swift
//  HappyStore
//
//  Created by Mahmoud El-Naggar on 3/28/18.
//  Copyright © 2018 Mahmoud El-Naggar. All rights reserved.
//

import Foundation
import RxSwift


class LoginViewModel {
    
    let loginNetworkManager = LoginNetworkManager()
    
    var passwordText = Variable<String>("")
    var emailText = Variable<String>("")
    
    
   
    private func isEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: emailText.value, options: [], range: NSRange(location: 0, length: emailText.value.count)) != nil
    }
    var isValidEmail :  Observable<Bool> {
        
        return Observable.of(isEmail())
    }
    
    var isValidPassword : Observable<Bool> {
        return Observable.of(passwordText.value.count > 5)
    }
    var isValid : Observable<Bool> {
        return Observable.combineLatest(passwordText.asObservable(),emailText.asObservable()) { password , email in
            password.count > 5 && self.isEmail()
        }
    }
    
    func login() -> Observable<LoginResponse> {
        
        return loginNetworkManager.login(email : emailText.value,password : passwordText.value)
    }
}
