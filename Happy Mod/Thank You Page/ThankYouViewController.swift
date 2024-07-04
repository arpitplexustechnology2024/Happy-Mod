//
//  ThankYouViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 03/07/24.
//

import UIKit
import GoogleMobileAds

class ThankYouViewController: UIViewController {
    
    @IBOutlet weak var adsView: UIView!
    var nativeAdUtility: NativeAdUtility?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Display the preloaded native ad
        if let nativeAdUtility = nativeAdUtility, let preloadedNativeAd = nativeAdUtility.preloadedNativeAd {
            guard
                let nibObjects = Bundle.main.loadNibNamed("NativeAdView", owner: nil, options: nil),
                let nativeAdView = nibObjects.first as? GADNativeAdView
            else {
                assert(false, "Could not load nib file for adView")
                return
            }
            nativeAdUtility.setAdView(nativeAdView, for: preloadedNativeAd, in: adsView)
        } else {
            nativeAdUtility?.loadAd()
        }
    }
    
    
    @IBAction func btnExitTapped(_ sender: UIButton) {
        exit(0)
    }
    
    
    @IBAction func btnHomePageTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}
