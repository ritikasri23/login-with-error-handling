//
//  ViewController.swift
//  DoCatchTryExample
//
//  Created by Ritika Srivastava on 30/01/18.
//  Copyright © 2018 Ritika Srivastava. All rights reserved.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    //For handling errors
    enum LoginError: Error {
        case invalidEmail
        case incorrectPasswordLength
        case incompleteForm
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override var prefersStatusBarHidden: Bool{
        return true
    }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //Text Field delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        
        return true
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        do {
            try login()
           //Transition to next screen by writing code here or using segue from storyboard.
            print("Logged in")
            
        } catch LoginError.incompleteForm {
            
           AlertMessage.showAlert(title: "Incomplete Form", message: "Please fill out both email and password fields", vc: self)
        } catch LoginError.invalidEmail {
            AlertMessage.showAlert(title: "Invalid Email Format", message: "Please make sure you format your email correctly", vc: self)
        } catch LoginError.incorrectPasswordLength {
            AlertMessage.showAlert(title: "Password Too Short", message: "Password should be at least 8 characters", vc: self)
        } catch {
            AlertMessage.showAlert(title: "Unable To Login", message: "There was an error when attempting to login", vc: self)
        }
        
    }
    
    func login() throws {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if email.isEmpty || password.isEmpty {
            throw LoginError.incompleteForm
        }
        
        if !email.isValidEmail {
            throw LoginError.invalidEmail
        }
        
        if password.count < 8 {
            throw LoginError.incorrectPasswordLength
        }
        
        // Pretend this is the great code that logs in my user :D
        
    }
    
}



