//
//  CheckoutViewController.swift
//  asap
//
//  Created by liusy182 on 1/5/16.
//  Copyright © 2016 liusy182. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    var cartStore: CartStore!
    
    static func instantiate() -> UIViewController {
        return UIStoryboard(name: "Checkout", bundle: nil).instantiateInitialViewController()!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshTotal()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBOutlet var tableView: UITableView!{
        didSet {
            tableView.separatorInset = UIEdgeInsetsZero
            tableView.dataSource = self
        }
    }
    
    @IBOutlet var buyButton: UIButton!  {
        didSet {
            buyButton.titleLabel?.font = UIFont.latoFontOfSize(24)
        }
    }
    
    @IBAction func buyTapped() {
        cartStore.buy()
        
        let alert = UIAlertController(title: "Done", message: "Thank you for buying at ASAP!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { _ in
            self.navigationController?.popToRootViewControllerAnimated(false)
        }))
        
        presentViewController(alert, animated: true, completion: nil)
    }

}

extension CheckoutViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartStore.count()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let product = cartStore.allProducts()[indexPath.row]
        cell.selectionStyle = .None
        cell.textLabel?.font = UIFont.latoLightFontOfSize(15)
        cell.textLabel?.text = product.name
        cell.imageView?.sd_setImageWithURL(product.imageURL)
        
        return cell
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Default, title: "delete") {
            [weak self] action, index in
            guard let product = self?.cartStore.allProducts()[index.row] else {
                return
            }
            self?.cartStore?.removeProduct(product)
            self?.refreshTotal()
            tableView.reloadData()
        }
        return [delete]
    }
}

private extension CheckoutViewController {
    func refreshTotal(){
        title = "Total: $\(cartStore.total)"
    }
}
