//
//  Cartstore.swift
//  asap
//
//  Created by liusy182 on 1/5/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import Foundation

class CartStore {
    private var products = [String:Product]()
    private let gateway: CartGateway
    
    init(gateway: CartGateway) {
        self.gateway = gateway
    }
    
    func containsProductID(productID: String) -> Bool {
        return products[productID] != nil
    }
    
    func addProduct(product: Product) {
        products[product.id] = product
        gateway.addProductID(product.id)
    }
    
    func removeProduct(product: Product) {
        products.removeValueForKey(product.id)
        gateway.removeProductID(product.id)
    }
    
    func allProducts() -> [Product] {
        return products.map() { item in return item.1 }
    }
    
    func buy() {
        products = [:]
        gateway.buy()
    }
    
    func count() -> Int {
        return products.count
    }
    
    var total: Double {
        get {
            return products.values.reduce(0) { partial, product in
                return partial + product.price
            }
        }
    }
}