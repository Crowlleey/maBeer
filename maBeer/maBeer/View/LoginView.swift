//
//  LoginView.swift
//  maBeer
//
//  Created by George Gomes on 16/08/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import UIKit
import PureLayout

class LoginView: UIView{
    
    var signInAction: (() -> Void)?
    
    var shouldSetupConstraints = true
    
    let screenSize = UIScreen.main.bounds

    var btLogin: UIButton!
    
    let tfEmail: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 5.0
        tf.autocorrectionType = .no
        tf.placeholder = "E-Mail"
        tf.textAlignment = .center
        tf.autoSetDimension(.height, toSize: 34.0)
        tf.keyboardAppearance = .dark
        return tf
    }()
    
    let tfSenha: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.layer.borderWidth = 1.0
        tf.layer.cornerRadius = 5.0
        tf.isSecureTextEntry = true
        tf.autocorrectionType = .no
        tf.placeholder = "Senha"
        tf.textAlignment = .center
        tf.autoSetDimension(.height, toSize: 34.0)
        tf.keyboardAppearance = .dark
        return tf
    }()

    let btSignIn: UIButton = {
        let bt = UIButton()
        
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(tfEmail)
        addSubview(tfSenha)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")}
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            
            setupTextFields()
            
         
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
    func setupTextFields(){
        let edgesInset: CGFloat = 10.0
        let topInset: CGFloat = 200.0
        
        tfEmail.widthAnchor.constraint(equalToConstant: 250).isActive = true
        tfEmail.heightAnchor.constraint(equalToConstant: 34).isActive = true
        tfEmail.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tfEmail.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        tfSenha.widthAnchor.constraint(equalToConstant: 250).isActive = true
        tfSenha.heightAnchor.constraint(equalToConstant: 34).isActive = true
        tfSenha.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tfSenha.topAnchor.constraint(equalTo: tfEmail.bottomAnchor, constant: 20).isActive = true
    }
    
}
