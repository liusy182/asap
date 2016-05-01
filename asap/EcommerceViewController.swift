//
//  EcommerceViewController.swift
//  asap
//
//  Created by liusy182 on 30/4/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import UIKit
import SDWebImage

class EcommerceViewController: UICollectionViewController {
    let productStore = ProductStore(gateway: LocalProductGateway())
    private var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ASAP"
        
        productStore.retrieve { [weak self] products in
            self?.products = products
            self?.collectionView?.reloadData()
        }
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
        
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
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
