//
//  AdsSkipViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 02/07/24.
//

import UIKit

class AdsSkipViewController: UIViewController {
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var adsView: UIView!
    private var nativeAdUtility: NativeAdUtility?
    var bannerAdUtility = BannerAdUtility()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.skipButton.layer.cornerRadius = 10
        nativeAdUtility = NativeAdUtility(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: self, nativeAdPlaceholder: adsView)
        bannerAdUtility.setupBannerAd(in: self, adUnitID: "ca-app-pub-3940256099942544/2435281174")
    }
    

    @IBAction func btnSkipTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "PlayegameViewController") as! PlayegameViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    

}
