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
    
    var loginAction: (() -> Void)?
    
    var shouldSetupConstraints = true
    
    let screenSize = UIScreen.main.bounds
    
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
    
    let tfPassword: UITextField = {
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

    let btLogin: UIButton = {
        let bt = UIButton()
        bt.setTitle("Login", for: .normal)
        bt.backgroundColor = .green
        return bt
    }()
    
    let btSignIn: UIButton = {
        let bt = UIButton()
        bt.setTitle("Login", for: .normal)
        bt.backgroundColor = .green
        return bt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addSubview(tfEmail)
        addSubview(tfPassword)
        addSubview(btLogin)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")}
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            
            setupTextFields()
            setupButtons()
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
// MARK: - Setup constraints
    
    func setupTextFields(){
    
        tfEmail.translatesAutoresizingMaskIntoConstraints = false
        
        // center horizontally and vertically
        tfEmail.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tfEmail.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        // make sure textfield width never exceeds the superview width
        tfEmail.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 20).isActive = true
        tfEmail.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: 20).isActive = true
        
        // give the textfield its default width, notice the lowered priority which
        // allows this constraint to be broken when needed to satisfy the above constraints
        let widthConstraint = tfEmail.widthAnchor.constraint(equalToConstant: 370)
        widthConstraint.priority = UILayoutPriority.defaultHigh
        widthConstraint.isActive = true
        tfEmail.heightAnchor.constraint(equalToConstant: 34).isActive = true
        
        tfPassword.translatesAutoresizingMaskIntoConstraints = false
        
        // center horizontally
        tfPassword.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        tfPassword.topAnchor.constraint(equalTo: tfEmail.bottomAnchor, constant: 20).isActive = true
        
        // make sure textfield width never exceeds the superview width
        tfPassword.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 20).isActive = true
        tfPassword.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: 20).isActive = true
        
        // give the textfield its default width, notice the lowered priority which
        // allows this constraint to be broken when needed to satisfy the above constraints
        let widthConstraintP = tfPassword.widthAnchor.constraint(equalToConstant: 370)
        widthConstraintP.priority = UILayoutPriority.defaultHigh
        widthConstraintP.isActive = true
        tfPassword.heightAnchor.constraint(equalToConstant: 34).isActive = true
    }
    
    func setupButtons(){
        btLogin.translatesAutoresizingMaskIntoConstraints = false
        btLogin.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        btLogin.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        
        btLogin.leftAnchor.constraint(greaterThanOrEqualTo: leftAnchor, constant: 20).isActive = true
        btLogin.rightAnchor.constraint(lessThanOrEqualTo: rightAnchor, constant: 20).isActive = true
        
        btLogin.heightAnchor.constraint(equalToConstant: 50).isActive = true

        let widthConstraint = btLogin.widthAnchor.constraint(equalToConstant: 370)
        widthConstraint.priority = UILayoutPriority.defaultHigh
        widthConstraint.isActive = true
        
        btLogin.addTarget(self, action: #selector(pressLogin), for: .touchUpInside)
    }
    
    @objc func pressLogin(){
        loginAction?()
    }
    
}
