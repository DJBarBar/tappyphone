//
//  ViewController.swift
//  Tappy Phone
//
//  Created by Cory Barton on 10/12/18.
//  Copyright © 2018 Cory Barton. All rights reserved.
//

import UIKit
import GoogleMobileAds

class ViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label1.layer.cornerRadius = 5.0
        button.layer.cornerRadius = 5.0
        
        bannerView.isHidden = true
        
        bannerView.delegate = self
        
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        
        bannerView.isHidden = false
        
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        
        bannerView.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "Record")
        
        if (value == nil) {
            
            label2.text = "0"
            
        } else {
            
            label2.text = value
            
        }
        
        let save = UserDefaults.standard
        if save.value(forKey: "purchase") == nil {
            
            bannerView.adUnitID = "ca-app-pub-8758014690935874/9772971215"
            bannerView.adSize = kGADAdSizeSmartBannerPortrait
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            
        } else {
            
            bannerView.isHidden = true
            
        }
        
    }
    
    
}


