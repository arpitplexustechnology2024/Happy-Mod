//
//  AdsSkipViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 02/07/24.
//

import UIKit
import GoogleMobileAds

class AdsSkipViewController: UIViewController {
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var adsView: UIView!
    var nativeAdUtility: NativeAdUtility?
    var bannerAdUtility = BannerAdUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.skipButton.layer.cornerRadius = 10
        bannerAdUtility.setupBannerAd(in: self, adUnitID: "ca-app-pub-3940256099942544/2435281174")
        nativeAdUtility?.loadAd()
        
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
    
    
    @IBAction func btnSkipTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlayegameViewController") as! PlayegameViewController
        vc.nativeAdUtility = nativeAdUtility
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
