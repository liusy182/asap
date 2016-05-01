//
//  ProductGateway.swift
//  asap
//
//  Created by liusy182 on 1/5/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import Foundation

protocol ProductGateway {
    func getProducts(completion: (String) -> Void)
}