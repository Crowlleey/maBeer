//
//  Authentication.swift
//  maBeer
//
//  Created by George Gomes on 16/08/18.
//  Copyright © 2018 CrowCode. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class Authentication{
    
    var ref: DatabaseReference!
    
    init() {
        ref = Database.database().reference()
    }
    
    func createUser(with email: String, _ password: String, completion: @escaping (AuthDataResult?, Error?) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
           completion(res, err)
        }
    }
    
    func login(with email: String,_ password: String, completion: @escaping (AuthDataResult?, Error?) -> Void){
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            
            if let r = res {
                self.addCevaRuim(uid: r.user.uid, name: "Kalena")
            }
            
            completion(res, err)
        }
    }
    
    func addCevaRuim(uid:String, name: String ){
        ref.child(uid).child("Cevas").childByAutoId().setValue(["Ceva +-":name, "ml": 200])
        
        ref.child(uid).child("Cevas").queryOrderedByKey().observeSingleEvent(of: .value) { (snp) in
            print(snp)
            
            _ = snp.value as! [String: Any]

        }
    }
    
}
