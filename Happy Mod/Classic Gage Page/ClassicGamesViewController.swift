//
//  ClassicGamesViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 03/07/24.
//

import UIKit
import GoogleMobileAds

class ClassicGamesViewController: UIViewController {
    
    @IBOutlet weak var classicGameCollectionview01: UICollectionView!
    @IBOutlet weak var classicGameCollectionView02: UICollectionView!
    @IBOutlet weak var adsView: UIView!
    var nativeAdUtility: NativeAdUtility?
    
    var imageArr = ["Garden Bloom","garden Match","Rush","Diamond Rush"]
    var imageeArr = ["Play Cricket","Win Cricket"]
    var nameArr = ["Garden Bloom","garden Match","Rush","Diamond Rush"]
    var nameeArr = ["Play Cricket","Win Cricket"]
    let gameLinks = ["https://www.crazygames.com/game/garden-bloom","https://www.gamepix.com/play/garden-match-3d","https://poki.com/en/g/match-arena","https://gamesnacks.com/games/diamondrush"]
    let gameeLinks = ["https://www.crazygames.com/game/cricket-frvr","https://poki.com/en/g/cricket-world-cup"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.classicGameCollectionview01.delegate = self
        self.classicGameCollectionView02.delegate = self
        self.classicGameCollectionview01.dataSource = self
        self.classicGameCollectionView02.dataSource = self
        
        
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

extension ClassicGamesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count:Int?
        
        if collectionView == self.classicGameCollectionview01 {
            count = imageArr.count
        }
        
        if collectionView == self.classicGameCollectionView02 {
            count =  imageeArr.count
        }
        
        return count!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.classicGameCollectionview01 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "classicGameCell01", for: indexPath) as! classicGameCell01
            cell.classicGameImageView.image = UIImage(named: imageArr[indexPath.row])
            cell.classicGameLabel.text = nameArr[indexPath.row]
            return cell
        }
        
        if collectionView == self.classicGameCollectionView02 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "classicGamesCell02", for: indexPath) as! classicGamesCell02
            cell.classicGameImageView.image = UIImage(named: imageeArr[indexPath.row])
            cell.classicGameLabel.text = nameeArr[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gameName: String
        let gameLink: String
        
        if collectionView == self.classicGameCollectionview01 {
            gameName = nameArr[indexPath.row]
            gameLink = gameLinks[indexPath.row]
        } else {
            gameName = nameeArr[indexPath.row]
            gameLink = gameeLinks[indexPath.row]
        }
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GameStartViewController") as! GameStartViewController
        vc.gameName = gameName
        vc.gameLink = gameLink
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
