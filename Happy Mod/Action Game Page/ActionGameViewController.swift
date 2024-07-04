//
//  ActionGameViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 02/07/24.
//

import UIKit
import GoogleMobileAds

class ActionGameViewController: UIViewController {
    
    @IBOutlet weak var actionGameCollectionview01: UICollectionView!
    @IBOutlet weak var actionGameCollectionView02: UICollectionView!
    @IBOutlet weak var adsView: UIView!
    var nativeAdUtility: NativeAdUtility?
    
    var imageArr = ["Truck Trials","Boat Battles","Jumo Justin","Canon Soldier"]
    var imageeArr = ["Play Cricket","Win Cricket"]
    var nameArr = ["Truck Trials","Boat Battles","Jumo Justin","Canon Soldier"]
    var nameeArr = ["Play Cricket","Win Cricket"]
    let gameLinks = ["https://gamesnacks.com/games/trucktrials", "https://www.gameflare.com/online-game/boat-battle/", "https://gamesnacks.com/games/jumpwithjustin2","https://www.primarygames.com/puzzles/physics/cannonsandsoldiersmountainoffense/"]
    let gameeLinks = ["https://www.crazygames.com/game/cricket-frvr","https://poki.com/en/g/cricket-world-cup"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actionGameCollectionview01.delegate = self
        self.actionGameCollectionView02.delegate = self
        self.actionGameCollectionview01.dataSource = self
        self.actionGameCollectionView02.dataSource = self
        
        
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
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ActionGameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.actionGameCollectionview01 {
            return imageArr.count
        } else {
            return imageeArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.actionGameCollectionview01 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActionGameCell01", for: indexPath) as! ActionGameCell01
            cell.actionGameImageView.image = UIImage(named: imageArr[indexPath.row])
            cell.actionGameLabel.text = nameArr[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActionGameCell02", for: indexPath) as! ActionGameCell02
            cell.actionGameImageView.image = UIImage(named: imageeArr[indexPath.row])
            cell.actionGameLabel.text = nameeArr[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gameName: String
        let gameLink: String
        
        if collectionView == self.actionGameCollectionview01 {
            gameName = nameArr[indexPath.row]
            gameLink = gameLinks[indexPath.row]
        } else {
            gameName = nameeArr[indexPath.row]
            gameLink = gameeLinks[indexPath.row]
        }
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GameStartViewController") as! GameStartViewController
        vc.gameName = gameName
        vc.gameLink = gameLink
        vc.nativeAdUtility = nativeAdUtility
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWith = collectionView.bounds.width
        
        return CGSize(width: collectionWith/2 - 5, height: collectionWith/2 - 35)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

