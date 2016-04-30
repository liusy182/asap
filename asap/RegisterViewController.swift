//
//  RegisterViewController.swift
//  asap
//
//  Created by liusy182 on 30/4/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import UIKit
import LatoFont

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
}

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func instantiate() -> RegisterViewController {
        return UIStoryboard(name: "Register", bundle: nil).instantiateInitialViewController() as! RegisterViewController
    }
    
    @IBOutlet var okButton: UIButton! {
        didSet {
            okButton.enabled = false
            okButton.titleLabel?.font = UIFont.latoFontOfSize(18)
        }
    }
    
    @IBOutlet var emailTextField: UITextField! {
        didSet {
            emailTextField.becomeFirstResponder()
            emailTextField.font = UIFont.latoFontOfSize(18)
        }
    }
    @IBAction func emailTextFieldChanged(sender: UITextField) {
        guard let text = sender.text else {
            return
        }
        okButton.enabled = text.isValidEmail()
    }
    
    @IBAction func signinTapped(sender: UIButton) {
        guard let text = emailTextField.text else {
            return
        }
        AppDelegate.appdelegate().userStore.setUserEmail(text)
        
        performSegueWithIdentifier("ShowEcommerceScene", sender: self)
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
