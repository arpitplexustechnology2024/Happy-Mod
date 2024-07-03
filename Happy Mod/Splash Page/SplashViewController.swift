//
//  SplashViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 02/07/24.
//

import UIKit

class SplashViewController: UIViewController, InterstitialAdUtilityDelegate {
    
    @IBOutlet weak var nextButton: UIButton!
    private let interstitialAdUtility = InterstitialAdUtility()

    override func viewDidLoad() {
        super.viewDidLoad()

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
           let secondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AdsSkipViewController")
           navigationController?.pushViewController(secondViewController, animated: true)
       }

}
