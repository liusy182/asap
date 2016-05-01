//
//  CartGateway.swift
//  asap
//
//  Created by liusy182 on 1/5/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import Foundation

protocol CartGateway {
    func addProductID(productID: String)
    func removeProductID(productID: String)
    func buy()
}