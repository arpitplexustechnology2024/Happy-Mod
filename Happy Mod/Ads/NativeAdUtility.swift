//
//  NativeAdUtility.swift
//  GoogleAds
//
//  Created by Arpit iOS Dev. on 01/07/24.
//

import GoogleMobileAds
import UIKit

class NativeAdUtility: NSObject {
    
    private var adLoader: GADAdLoader?
    private weak var rootViewController: UIViewController?
    private var adUnitID: String?
    var preloadedNativeAd: GADNativeAd?
    
    init(adUnitID: String, rootViewController: UIViewController) {
        self.adUnitID = adUnitID
        self.rootViewController = rootViewController
        super.init()
    }
    
    func loadAd() {
        adLoader = GADAdLoader(adUnitID: adUnitID!, rootViewController: rootViewController!,
                               adTypes: [.native], options: nil)
        adLoader?.delegate = self
        adLoader?.load(GADRequest())
    }
    
    func setAdView(_ view: GADNativeAdView, for nativeAd: GADNativeAd, in placeholder: UIView) {
        placeholder.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let viewDictionary = ["_nativeAdView": view]
        placeholder.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|[_nativeAdView]|",
                options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        )
        placeholder.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[_nativeAdView]|",
                options: NSLayoutConstraint.FormatOptions(rawValue: 0), metrics: nil, views: viewDictionary)
        )
        
        populateAdContent(nativeAdView: view, nativeAd: nativeAd)
    }
    
    private func populateAdContent(nativeAdView: GADNativeAdView, nativeAd: GADNativeAd) {
        nativeAdView.nativeAd = nativeAd
        
        (nativeAdView.headlineView as? UILabel)?.text = nativeAd.headline
        nativeAdView.mediaView?.mediaContent = nativeAd.mediaContent
        
        if let mediaView = nativeAdView.mediaView, nativeAd.mediaContent.aspectRatio > 0 {
            let heightConstraint = NSLayoutConstraint(
                item: mediaView,
                attribute: .height,
                relatedBy: .equal,
                toItem: mediaView,
                attribute: .width,
                multiplier: CGFloat(1 / nativeAd.mediaContent.aspectRatio),
                constant: 0)
            heightConstraint.isActive = true
        }
        
        (nativeAdView.bodyView as? UILabel)?.text = nativeAd.body
        nativeAdView.bodyView?.isHidden = nativeAd.body == nil
        
        (nativeAdView.callToActionView as? UIButton)?.setTitle(nativeAd.callToAction, for: .normal)
        nativeAdView.callToActionView?.isHidden = nativeAd.callToAction == nil
        
        (nativeAdView.iconView as? UIImageView)?.image = nativeAd.icon?.image
        nativeAdView.iconView?.isHidden = nativeAd.icon == nil
        
        (nativeAdView.starRatingView as? UIImageView)?.image = imageOfStars(from: nativeAd.starRating)
        nativeAdView.starRatingView?.isHidden = nativeAd.starRating == nil
        
        (nativeAdView.storeView as? UILabel)?.text = nativeAd.store
        nativeAdView.storeView?.isHidden = nativeAd.store == nil
        
        (nativeAdView.priceView as? UILabel)?.text = nativeAd.price
        nativeAdView.priceView?.isHidden = nativeAd.price == nil
        
        (nativeAdView.advertiserView as? UILabel)?.text = nativeAd.advertiser
        nativeAdView.advertiserView?.isHidden = nativeAd.advertiser == nil
        
        nativeAdView.callToActionView?.isUserInteractionEnabled = false
    }
    
    private func imageOfStars(from starRating: NSDecimalNumber?) -> UIImage? {
        guard let rating = starRating?.doubleValue else {
            return nil
        }
        if rating >= 5 {
            return UIImage(named: "stars_5")
        } else if rating >= 4.5 {
            return UIImage(named: "stars_4_5")
        } else if rating >= 4 {
            return UIImage(named: "stars_4")
        } else if rating >= 3.5 {
            return UIImage(named: "stars_3_5")
        } else {
            return nil
        }
    }
}

extension NativeAdUtility: GADAdLoaderDelegate, GADNativeAdLoaderDelegate {
    
    func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: Error) {
        print("Failed to receive ad with error: \(error.localizedDescription)")
    }
    
    func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADNativeAd) {
        print("Received native ad: \(nativeAd)")
        self.preloadedNativeAd = nativeAd
    }
}

extension NativeAdUtility: GADNativeAdDelegate {
    
    func nativeAdDidRecordClick(_ nativeAd: GADNativeAd) {
        print("nativeAdDidRecordClick called")
    }
    
    func nativeAdDidRecordImpression(_ nativeAd: GADNativeAd) {
        print("nativeAdDidRecordImpression called")
    }
    
    func nativeAdWillPresentScreen(_ nativeAd: GADNativeAd) {
        print("nativeAdWillPresentScreen called")
    }
    
    func nativeAdWillDismissScreen(_ nativeAd: GADNativeAd) {
        print("nativeAdWillDismissScreen called")
    }
    
    func nativeAdDidDismissScreen(_ nativeAd: GADNativeAd) {
        print("nativeAdDidDismissScreen called")
    }
    
    func nativeAdWillLeaveApplication(_ nativeAd: GADNativeAd) {
        print("nativeAdWillLeaveApplication called")
    }
}
