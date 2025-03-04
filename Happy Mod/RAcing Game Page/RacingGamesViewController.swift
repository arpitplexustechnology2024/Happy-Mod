//
//  RacingGamesViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 03/07/24.
//

import UIKit
import GoogleMobileAds

class RacingGamesViewController: UIViewController {
    
    @IBOutlet weak var racingGameCollectionview01: UICollectionView!
    @IBOutlet weak var racingGameCollectionView02: UICollectionView!
    @IBOutlet weak var adsView: UIView!
    var nativeAdUtility: NativeAdUtility?
    
    var imageArr = ["Bus Simulator","Highway Rider","Play Cricket","Win Cricket"]
    var imageeArr = ["EScooter","Traffic Tom"]
    var nameArr = ["Bus Simulator","Highway Rider","Play Cricket","Win Cricket"]
    var nameeArr = ["EScooter","Traffic Tom"]
    let gameLinks = ["https://gameforge.com/en-US/littlegames/coach-bus-simulator/#","https://www.crazygames.com/game/highway-rider-extreme","https://www.crazygames.com/game/cricket-frvr","https://poki.com/en/g/cricket-world-cup"]
    let gameeLinks = ["https://www.crazygames.com/game/e-scooter","https://gamesnacks.com/games/traffictom"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.racingGameCollectionview01.delegate = self
        self.racingGameCollectionView02.delegate = self
        self.racingGameCollectionview01.dataSource = self
        self.racingGameCollectionView02.dataSource = self
        
        
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

extension RacingGamesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count:Int?
        
        if collectionView == self.racingGameCollectionview01 {
            count = imageArr.count
        }
        
        if collectionView == self.racingGameCollectionView02 {
            count =  imageeArr.count
        }
        
        return count!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.racingGameCollectionview01 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RacingGamesCell01", for: indexPath) as! RacingGamesCell01
            cell.racingGameImageView.image = UIImage(named: imageArr[indexPath.row])
            cell.racingGameLabel.text = nameArr[indexPath.row]
            return cell
        }
        
        if collectionView == self.racingGameCollectionView02 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RacingGamesCell02", for: indexPath) as! RacingGamesCell02
            cell.racingGameImageView.image = UIImage(named: imageeArr[indexPath.row])
            cell.racingGameLabel.text = nameeArr[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let gameName: String
        let gameLink: String
        
        if collectionView == self.racingGameCollectionview01 {
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
