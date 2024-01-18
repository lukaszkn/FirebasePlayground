//
//  ViewController.swift
//  iOSFirebasePlayground
//
//  Created by Lukasz on 17/01/2024.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        ref.child("posts").childByAutoId().setValue(["title" : "Sample title", "body" : "Sample body"])
        
        Task {
            await readData()
        }
    }

    func readData() async {
       
        ref.child("posts").observeSingleEvent(of: .value, with: { snapshot in
            let value = snapshot.value as? NSDictionary
            print(value)
        }) { error in
            print(error.localizedDescription)
        }
    }
}

