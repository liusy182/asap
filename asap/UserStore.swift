//
//  UserStore.swift
//  asap
//
//  Created by liusy182 on 30/4/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import Foundation

typealias Email = String

class UserStore {
    private struct Constants {
        static let emailKey = "emailKey"
    }
    
    func setUserEmail(email: Email) {
        NSUserDefaults.standardUserDefaults().setObject(email, forKey: Constants.emailKey)
    }
    
    func userEmail() -> Email? {
        return NSUserDefaults
            .standardUserDefaults()
            .objectForKey(Constants.emailKey) as? Email
    }
    
    func isUserSignedIn() -> Bool {
        return userEmail() != nil
    }
}