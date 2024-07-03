//
//  ThankYouViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 03/07/24.
//

import UIKit

class ThankYouViewController: UIViewController {

    @IBOutlet weak var adsView: UIView!
    private var nativeAdUtility: NativeAdUtility?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nativeAdUtility = NativeAdUtility(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: self, nativeAdPlaceholder: adsView)
    }
    
    
    @IBAction func btnExitTapped(_ sender: UIButton) {
        exit(0)
    }
    
    
    @IBAction func btnHomePageTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    


}
