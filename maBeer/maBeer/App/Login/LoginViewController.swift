//
//  LoginViewController.swift
//  maBeer
//
//  Created by George Gomes on 16/08/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {
    
    let loginView: LoginView = LoginView()
    let loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        loginView.loginAction = pressedLogin
        view.addSubview(loginView)
        loginView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        
        setUpValidations()
    }
    
    func setUpValidations(){
        _ = loginView.tfPassword.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.password)
        _ = loginView.tfEmail.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText)
        
        _ = loginViewModel.isValidPassword.bind(to: loginView.btLogin.rx.isEnabled)
        
        loginViewModel.isValidEmail.subscribe(onNext: {[unowned self] isValid in
            self.loginView.setEmailBorderColor(isValid)
        }).disposed(by: disposeBag)
        
        loginViewModel.isValidPassword.subscribe(onNext: {[unowned self]isValid in
            self.loginView.setPasswordBorderColor(isValid)
        }).disposed(by: disposeBag)
    }
    
    func pressedLogin(){

    }
}
