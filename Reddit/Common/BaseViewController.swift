//
//  BaseViewController.swift
//  Reddit
//
//  Created by Suneeth on 9/19/20.
//  Copyright © 2020 Suneeth. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func checkReachability() -> Bool {
        if Reachability.isNetwrokReachable() == false {
            let alert = UIAlertController(title: ErrorConstants.ErrorTitles.noNetwork, message: ErrorConstants.ErrorMessages.noNetwork, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false
        }
        return true
    }
}
