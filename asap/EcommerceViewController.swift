//
//  EcommerceViewController.swift
//  asap
//
//  Created by liusy182 on 30/4/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import UIKit
import SDWebImage
import BBBadgeBarButtonItem
import FontAwesomeKit

class EcommerceViewController: UICollectionViewController {
    let productStore = ProductStore(gateway: LocalProductGateway())
    private var products: [Product] = []
    
    let cartStore = CartStore(gateway: LocalCartGateway())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ASAP"
        
        setupCart()
        productStore.retrieve { [weak self] products in
            self?.products = products
            self?.collectionView?.reloadData()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshCartCount()
        collectionView?.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    static func instantiate() -> UIViewController {
        return UIStoryboard(name: "Ecommerce", bundle: nil).instantiateInitialViewController()!
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! ProductCollectionViewCell
        
        let product = products[indexPath.row]
        cell.modelLabel.text = product.name
        cell.descriptionLabel.text = product.description
        cell.imageView.sd_setImageWithURL(product.imageURL)
        cell.priceLabel.text = "$\(product.price)"
        
        if cartStore.containsProductID(product.id) {
            cell.backgroundColor = UIColor.lightGrayColor()
        } else {
            cell.backgroundColor = UIColor.clearColor()
        }
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let product = products[indexPath.row]
        
        if cartStore.containsProductID(product.id) {
            cartStore.removeProduct(product)
        } else {
            cartStore.addProduct(product)
        }
        collectionView.reloadData()
        refreshCartCount()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let checkoutViewController = segue.destinationViewController as? CheckoutViewController else {
                return
        }
        
        checkoutViewController.cartStore = cartStore
    }

}


extension EcommerceViewController {
    func setupCart() {
        let button = UIButton(type: .Custom)
        let icon = FAKFontAwesome.shoppingCartIconWithSize(20)
        button.setAttributedTitle(icon.attributedString(), forState: .Normal)
        button.addTarget(self, action: #selector(EcommerceViewController.cartButtonTapped(_:)), forControlEvents: .TouchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        let cartBarButton = BBBadgeBarButtonItem(customUIButton: button)
        cartBarButton.badgeOriginX = 0
        cartBarButton.badgeOriginY = 0
        navigationItem.rightBarButtonItem = cartBarButton
    }
    
    func cartButtonTapped(sender: UIButton) {
        performSegueWithIdentifier("showCheckoutScene", sender: self)
    }
    
    func refreshCartCount() {
        guard let cartBarButton = navigationItem.rightBarButtonItem as? BBBadgeBarButtonItem else {
            return
        }
        
        cartBarButton.badgeValue = "\(cartStore.count())"
    }
}