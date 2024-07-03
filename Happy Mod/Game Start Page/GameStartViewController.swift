//
//  GameStartViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 03/07/24.
//

import UIKit

class GameStartViewController: UIViewController {
    
    @IBOutlet weak var gameStartCollectionview: UICollectionView!
    @IBOutlet weak var playGameButton: UIButton!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var adsView: UIView!
    private var nativeAdUtility: NativeAdUtility?
    var bannerAdUtility = BannerAdUtility()
    
    var gameAdsImageArr =
    ["AdCard01","AdCard02","AdCard03","AdCard04","AdCard05","AdCard06","AdCard07","AdCard08","AdCard01","AdCard02","AdCard03","AdCard04"]
    
    var gameName: String?
    var gameLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playGameButton.layer.cornerRadius = 10
        self.gameStartCollectionview.delegate = self
        self.gameStartCollectionview.dataSource = self
        gameNameLabel.text = gameName
        nativeAdUtility = NativeAdUtility(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: self, nativeAdPlaceholder: adsView)
        bannerAdUtility.setupBannerAd(in: self, adUnitID: "ca-app-pub-3940256099942544/2435281174")
        
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnPlayGameTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let webViewController = storyboard.instantiateViewController(identifier: "WebPlaygameViewController") as! WebPlaygameViewController
              webViewController.urlString = gameLink
              self.navigationController?.pushViewController(webViewController, animated: true)
          }
}


extension GameStartViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gameAdsImageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameStartCollectionViewCell", for: indexPath) as! GameStartCollectionViewCell
        cell.gameAdsImageView.image = UIImage(named: gameAdsImageArr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWith = collectionView.bounds.width
        
        return CGSize(width: collectionWith/4, height: collectionWith/4 - 15)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

