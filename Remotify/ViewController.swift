//
//  ViewController.swift
//  Remotify
//
//  Created by Salil Thakur on 8/14/17.
//  Copyright © 2017 Salil Thakur. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
  
  @IBOutlet var lightSwitch: UISwitch!
  var ref: DatabaseReference!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ref = Database.database().reference().child("room")
    
    ref.observe(.value) { (snapshot: DataSnapshot) in
      let value = snapshot.value as? NSDictionary
      if let light_state = value?["light_state"] as? Bool {
        self.lightSwitch.setOn(light_state, animated: true)
      }
    }
  }

  @IBAction func didToggleSwitch(_ sender: Any) {
    ref.setValue(["light_state": self.lightSwitch.isOn])
  }

}

