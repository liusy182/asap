//
//  LocalProductGateway.swift
//  asap
//
//  Created by liusy182 on 1/5/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import Foundation

class LocalProductGateway : ProductGateway {
    
    func getProducts(completion: (String) -> Void) {
        let path = NSBundle.mainBundle().pathForResource("products", ofType: "json")
        
        do {
            completion(try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding))
        } catch {
            completion("[:]")
        }
    }

}