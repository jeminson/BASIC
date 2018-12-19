//
//  ViewController.swift
//  TouchIDDemo
//
//  Created by Je Min Son on 12/19/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

import UIKit
import LocalAuthentication

class HomeViewController: UIViewController {
    
    var error: NSError?

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - IBAction
    @IBAction func loginBtnAction(_ sender: UIButton) {
        
        // 1. Create a authentication context
        let authenticationContext = LAContext()
        // What does it do?
        // Why do you need it? It creates and configures the context so that it can carry out the authentication
        
        
        // 2. Check if the device has a fingerprint sensor
        guard authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
            showAlertControllerIfNoBiometricSensorHasBeenDetectd()
            return
        }
        
        // 3. Check the fingerprint
        authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Only for authentication users") { (success, error) in
            
            if success  {
                //FingerPrint is reconigized
                self.goToLoggedInVC()
            } else {
                print("error")
            }
        }
    }
    
    
    // MARK: - Methods
    func showAlertControllerIfNoBiometricSensorHasBeenDetectd() {
        showAlertWithTitle(title: "Error", msg: "This device does not have TouchID sensor")
    }
    
    func showAlertWithTitle(title: String, msg: String) {
        let alertViewController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertViewController.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alertViewController, animated: true, completion: nil)
        }
    }
    
    func errorMsgForLAErrorCode(errorCode: Int) -> String {

        var message = ""

        switch errorCode {

        case LAError.appCancel.rawValue:
            message = "Authentication was cancelled by application"

        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"

        case LAError.invalidContext.rawValue:
            message = "The context is invalid"

        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"

        case LAError.systemCancel.rawValue:
            message = "Authentication was cancelled by the system"

        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attempts."

        case LAError.touchIDNotAvailable.rawValue:
            message = "TouchID is not available on the device"

        case LAError.userCancel.rawValue:
            message = "The user did cancel"

        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"

        default:
            message = "Did not find error code on LAError object"

        }

        return message
    }
    
    func goToLoggedInVC() {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "LoggedInViewController") as? LoggedInViewController {
            
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
}

