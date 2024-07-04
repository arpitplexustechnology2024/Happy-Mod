//
//  CardGamesViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 03/07/24.
//

import UIKit
import GoogleMobileAds

class CardGamesViewController: UIViewController {
    
    @IBOutlet weak var cardGameCollectionview01: UICollectionView!
    @IBOutlet weak var cardGameCollectionView02: UICollectionView!
    @IBOutlet weak var adsView: UIView!
    var nativeAdUtility: NativeAdUtility?
    
    var imageArr = ["Solitaire Klondike","Duo Cards","3D Solitaire","Gin Rummy Plus"]
    var imageeArr = ["Play Cricket","Win Cricket"]
    var nameArr = ["Solitaire Klondike","Duo Cards","3D Solitaire","Gin Rummy Plus"]
    var nameeArr = ["Play Cricket","Win Cricket"]
    let gameLinks = ["https://solitaired.com/klondike-solitaire","https://www.silvergames.com/en/duo-cards","https://www.gameflare.com/online-game/3d-solitaire/","https://www.mysteinbach.ca/game-zone/1708/gin-rummy-plus/"]
    let gameeLinks = ["https://www.crazygames.com/game/cricket-frvr","https://poki.com/en/g/cricket-world-cup"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.cardGameCollectionview01.delegate = self
        self.cardGameCollectionView02.delegate = self
        self.cardGameCollectionview01.dataSource = self
        self.cardGameCollectionView02.dataSource = self
        
        
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

extension CardGamesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count:Int?
        
        if collectionView == self.cardGameCollectionview01 {
            count = imageArr.count
        }
        
        if collectionView == self.cardGameCollectionView02 {
            count =  imageeArr.count
        }
        
        return count!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.cardGameCollectionview01 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardGamesCell01", for: indexPath) as! CardGamesCell01
            cell.cardGameImageView.image = UIImage(named: imageArr[indexPath.row])
            cell.cardGameLabel.text = nameArr[indexPath.row]
            return cell
        }
        
        if collectionView == self.cardGameCollectionView02 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardGamesCell02", for: indexPath) as! CardGamesCell02
            cell.cardGameImageView.image = UIImage(named: imageeArr[indexPath.row])
            cell.cardGameLabel.text = nameeArr[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gameName: String
        let gameLink: String
        
        if collectionView == self.cardGameCollectionview01 {
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
