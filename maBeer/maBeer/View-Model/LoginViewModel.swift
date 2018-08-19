//
//  LoginViewModel.swift
//  maBeer
//
//  Created by George Gomes on 16/08/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import Foundation
import RxSwift

struct LoginViewModel{
    let emailText = Variable<String>("")
    let password = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), password.asObservable()){ email, pass in
            email.count > 3
        }
    }
    
    var isValidPassword: Observable<Bool> {
        return password.asObservable().map({
            $0.count >= 6 && $0.count < 10
        })
    }
}
