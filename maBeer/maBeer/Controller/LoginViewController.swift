//
//  LoginViewController.swift
//  maBeer
//
//  Created by George Gomes on 16/08/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var loginView: LoginView!
        
        loginView = LoginView()
        view.addSubview(loginView)
        loginView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets.zero)
        
        
        let comm = Authentication()
     
        comm.login(with: "georgegomees@gmail.com", "123123") { (res, err) in
            print(res!)
            print(err!)
        }
    }
    
    
    
}
