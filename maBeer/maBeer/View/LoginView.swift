//
//  LoginView.swift
//  maBeer
//
//  Created by George Gomes on 16/08/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import UIKit

class LoginView: UIView{
    
    var shouldSetupConstraints = true
    
    var tfEmail: UITextField!
    var tfSenha: UITextField!
    var btLogin: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // DE que maneira desenvolver uma aplicação que auxilie uma equipe de scrum
        // a gerenciar suas tarefas por meio de um dispositivo movel a fim de
        // aumentar a produtividade de trabalho.
        
        self.tfEmail = UITextField(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    // POD INSTALL
}
