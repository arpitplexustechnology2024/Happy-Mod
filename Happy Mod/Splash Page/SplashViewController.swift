//
//  SplashViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 02/07/24.
//

import UIKit

class SplashViewController: UIViewController, InterstitialAdUtilityDelegate {
    
    @IBOutlet weak var nextButton: UIButton!
    let interstitialAdUtility = InterstitialAdUtility()
    var nativeAdUtility: NativeAdUtility?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // native ad pre load
        nativeAdUtility = NativeAdUtility(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: self)
        nativeAdUtility?.loadAd()
        
        interstitialAdUtility.delegate = self
        self.nextButton.layer.cornerRadius = self.nextButton.frame.height / 2
        Task {
            await interstitialAdUtility.loadInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        }
        
    }
    
    @IBAction func btnNextTapped(_ sender: UIButton) {
        
        interstitialAdUtility.presentInterstitial(from: self)
    }
    
    // MARK: - InterstitialAdUtilityDelegate
    
    func didFailToLoadInterstitial() {
        navigateToSecondViewController()
    }
    
    func didFailToPresentInterstitial() {
        navigateToSecondViewController()
    }
    
    func didDismissInterstitial() {
        navigateToSecondViewController()
    }
    
    private func navigateToSecondViewController() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdsSkipViewController") as! AdsSkipViewController
        vc.nativeAdUtility = nativeAdUtility
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
