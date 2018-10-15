//
//  StoreViewController.swift
//  Tappy Phone
//
//  Created by Cory Barton on 10/14/18.
//  Copyright © 2018 Cory Barton. All rights reserved.
//

import UIKit
import StoreKit

class StoreViewController: UIViewController, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    
    var product: SKProduct?
    var productID = "com.corybarton.tappyphone.removeads"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.layer.cornerRadius = 5.0
        button1.layer.cornerRadius = 5.0
        buyButton.layer.cornerRadius = 5.0
        
        buyButton.isEnabled = false
        SKPaymentQueue.default().add(self)
        getPurchaseInfo()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func purchase(_ sender: Any) {
        
        let payment = SKPayment(product: product!)
        SKPaymentQueue.default().add(payment)
        
    }
    
    func getPurchaseInfo() {
        
        if SKPaymentQueue.canMakePayments() {
            
            let request = SKProductsRequest(productIdentifiers: NSSet(objects: self.productID) as! Set<String>)
            
            request.delegate = self
            request.start()
            
        } else {
            
            productTitle.text = "Warning"
            productDescription.text = "Please enable in app purchases in your settings"
            
        }
        
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        
        var products = response.products
        
        if (products.count == 0) {
            
            productTitle.text = "Warning"
            productDescription.text = "Product Not Found!"
            
        } else {
            
            product = products[0]
            productTitle.text = product!.localizedTitle
            productDescription.text = product!.localizedDescription
            buyButton.isEnabled = true
            
        }
        
        let invalids = response.invalidProductIdentifiers
        
        for product in invalids {
            
            print("product not found \(product)")
            
        }
        
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        
        for transaction in transactions {
            
            switch transaction.transactionState {
            case SKPaymentTransactionState.purchased:
                
                SKPaymentQueue.default().finishTransaction(transaction)
                productTitle.text = "Thank you"
                productDescription.text = "The product has been purchased"
                buyButton.isEnabled = false
                
            case SKPaymentTransactionState.failed:
                
                SKPaymentQueue.default().finishTransaction(transaction)
                productTitle.text = "Warning"
                productDescription.text = "The product has not been purchased"
                
            default:
                break
                
            }
            
        }
        
    }
    
}
