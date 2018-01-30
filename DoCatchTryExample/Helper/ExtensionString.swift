//
//  ExtensionString.swift
//  DoCatchTryExample
//
//  Created by Ritika Srivastava on 30/01/18.
//  Copyright © 2018 Ritika Srivastava. All rights reserved.
//

import Foundation

//Function to test email regex
extension String{
    
var isValidEmail: Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: self)
    return result
}
}
