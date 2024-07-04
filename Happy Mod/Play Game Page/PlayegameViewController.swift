//
//  PlayegameViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 02/07/24.
//

import UIKit
import GoogleMobileAds

class PlayegameViewController: UIViewController {
    
    @IBOutlet weak var playGameButton: UIButton!
    @IBOutlet weak var firstAdbutton: UIButton!
    @IBOutlet weak var secAdButton: UIButton!
    @IBOutlet weak var adsView: UIView!
    var nativeAdUtility: NativeAdUtility?
    var bannerAdUtility = BannerAdUtility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.playGameButton.layer.cornerRadius = 10
        bannerAdUtility.setupBannerAd(in: self, adUnitID: "ca-app-pub-3940256099942544/2435281174")
        
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
        
        let maskPath01 = UIBezierPath(roundedRect: firstAdbutton.bounds,
                                      byRoundingCorners: [.topRight, .bottomRight],
                                      cornerRadii: CGSize(width: 10, height: 10))
        let shape01 = CAShapeLayer()
        shape01.path = maskPath01.cgPath
        firstAdbutton.layer.mask = shape01
        
        let maskPath02 = UIBezierPath(roundedRect: secAdButton.bounds,
                                      byRoundingCorners: [.topRight, .bottomRight],
                                      cornerRadii: CGSize(width: 10, height: 10))
        let shape02 = CAShapeLayer()
        shape02.path = maskPath02.cgPath
        secAdButton.layer.mask = shape02
    }
    
    
    @IBAction func btnPlayGameTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
