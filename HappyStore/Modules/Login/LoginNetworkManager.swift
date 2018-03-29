//
//  LoginNetworkManager.swift
//  HappyStore
//
//  Created by Mahmoud El-Naggar on 3/29/18.
//  Copyright © 2018 Mahmoud El-Naggar. All rights reserved.
//

import Foundation
import RxSwift

class LoginNetworkManager {
    
    func login(email : String, password : String) -> Observable<LoginResponse> {
        return Observable.of(LoginResponse())
    }
}
