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
    let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(emailText.asObservable(), password.asObservable()){ email, pass in
            email.count > 3
        }
    }

    var isValidEmail: Observable<Bool> {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", regex)
        return emailText.asObservable().map({
            emailTest.evaluate(with: $0)
        })
    }
    
    var isValidPassword: Observable<Bool> {
        return password.asObservable().map({
            $0.count >= 6
        })
    }
}
