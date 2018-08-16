//
//  ViewController.swift
//  maBeer
//
//  Created by George Gomes on 16/08/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("OPA")
        
        let comm = Authentication()
        
//        comm.createUser(with: "georgegomees@gmail.com", "123123") { (res, err) in
//            print(res)
//            print(err)
//        }
//        
        comm.login(with: "georgegomees@gmail.com", "123123") { (res, err) in
            print(res)
            print(err)
        }
        
  
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

