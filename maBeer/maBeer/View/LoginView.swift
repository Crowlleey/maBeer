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
    
    var shouldSetupConstraints = true
    
    let screenSize = UIScreen.main.bounds
    
    var tfEmail: UITextField!
    var tfSenha: UITextField!
    var btLogin: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        self.tfEmail = UITextField(frame: CGRect.zero)
        self.tfEmail.backgroundColor = UIColor.gray
        self.tfEmail.layer.borderColor = UIColor.blue.cgColor
        self.tfEmail.layer.borderWidth = 1.0
        self.tfEmail.layer.cornerRadius = 5.0
        self.tfEmail.isEnabled = true
        
      
        self.tfEmail.autoSetDimension(.height, toSize: 34.0)
        self.tfEmail.keyboardAppearance = .dark
        self.tfEmail.isUserInteractionEnabled = true

        self.addSubview(self.tfEmail)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            
            let edgesInset: CGFloat = 10.0
            self.tfEmail.autoPinEdge(toSuperviewEdge: .bottom, withInset: edgesInset)
            self.tfEmail.autoPinEdge(toSuperviewEdge: .left, withInset: edgesInset)
            self.tfEmail.autoPinEdge(toSuperviewEdge: .right, withInset: edgesInset)
            
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
}
