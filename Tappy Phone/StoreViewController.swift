//
//  StoreViewController.swift
//  Tappy Phone
//
//  Created by Cory Barton on 10/14/18.
//  Copyright © 2018 Cory Barton. All rights reserved.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.layer.cornerRadius = 5.0
        button1.layer.cornerRadius = 5.0
        buyButton.layer.cornerRadius = 5.0
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func purchase(_ sender: Any) {
    }
    
}
