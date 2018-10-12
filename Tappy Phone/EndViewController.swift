//
//  EndViewController.swift
//  Tappy Phone
//
//  Created by Cory Barton on 10/12/18.
//  Copyright © 2018 Cory Barton. All rights reserved.
//

import UIKit
import GoogleMobileAds

class EndViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    
    var scoreData:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        label1.layer.cornerRadius = 5.0
        shareButton.layer.cornerRadius = 5.0
        restartButton.layer.cornerRadius = 5.0
        
        scoreLabel.text = scoreData
        
        bannerView.isHidden = true
        
        bannerView.delegate = self
        
        bannerView.adUnitID = "ca-app-pub-8758014690935874/9772971215"
        bannerView.adSize = kGADAdSizeSmartBannerPortrait
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
    }
    
    func adViewDidReceiveAd(_ bannerView: GADBannerView) {
        
        bannerView.isHidden = false
        
    }
    
    func adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError) {
        
        bannerView.isHidden = true
        
    }
    
    @IBAction func restartGame(_ sender: Any) {
        
        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
        
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        
        let string = "I'm a tapping machine! My final score was: \(scoreLabel.text!)!"
        
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: .none)
        
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
}

