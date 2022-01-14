//
//  ViewController.swift
//  changeIconTest
//
//  Created by 陈培爵 on 2022/1/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func click1(_ sender: Any) {
        changeAppIconWithName("mi")
    }
    
    @IBAction func click2(_ sender: Any) {
        changeAppIconWithName("rr")
    }
    
    @IBAction func mainClick(_ sender: Any) {
        changeAppIconWithName(nil)
    }
    
    func changeAppIconWithName(_ iconName: String?) {
        if !UIApplication.shared.supportsAlternateIcons {
            return;
        }
        UIApplication.shared.setAlternateIconName(iconName) { error in
            if error != nil {
                print("change app icon error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
}

