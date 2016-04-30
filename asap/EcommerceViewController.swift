//
//  EcommerceViewController.swift
//  asap
//
//  Created by liusy182 on 30/4/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import UIKit

class EcommerceViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ASAP"
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
        
        switch arc4random_uniform(4) {
        case 0:
            cell.backgroundColor = UIColor.redColor()
        case 1:
            cell.backgroundColor = UIColor.greenColor()
        case 2:
            cell.backgroundColor = UIColor.blueColor()
        default:
            cell.backgroundColor = UIColor.orangeColor()
        }
        
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
