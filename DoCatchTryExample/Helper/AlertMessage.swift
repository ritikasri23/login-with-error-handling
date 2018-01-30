//
//  AlertMessage.swift
//  DoCatchTryExample
//
//  Created by Ritika Srivastava on 30/01/18.
//  Copyright © 2018 Ritika Srivastava. All rights reserved.
//

import Foundation
import UIKit

   class AlertMessage{
    
        class func showAlert(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}

