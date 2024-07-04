//
//  CategoryViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 02/07/24.
//

import UIKit

class CategoryViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionview: UICollectionView!
    @IBOutlet weak var ActionGamesButton: UIButton!
    @IBOutlet weak var Classic_GamesButton: UIButton!
    @IBOutlet weak var Racing_GamesButton: UIButton!
    @IBOutlet weak var Mind_GamesButton: UIButton!
    @IBOutlet weak var Card_GamesButton: UIButton!
    var nativeAdUtility: NativeAdUtility?
    var bannerAdUtility = BannerAdUtility()
    
    var cotegoryImageArr = ["categoryAds01","categoryAds02","categoryAds03","categoryAds01","categoryAds02","categoryAds03"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionview.delegate = self
        categoryCollectionview.dataSource = self
        self.ActionGamesButton.layer.cornerRadius = 10
        self.Classic_GamesButton.layer.cornerRadius = 10
        self.Racing_GamesButton.layer.cornerRadius = 10
        self.Mind_GamesButton.layer.cornerRadius = 10
        self.Card_GamesButton.layer.cornerRadius = 10
        
        nativeAdUtility = NativeAdUtility(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: self)
        nativeAdUtility?.loadAd()
        
        bannerAdUtility.setupBannerAd(in: self, adUnitID: "ca-app-pub-3940256099942544/2435281174")
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnActionGameTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ActionGameViewController") as! ActionGameViewController
        vc.nativeAdUtility = nativeAdUtility
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnClassicGameTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ClassicGamesViewController") as! ClassicGamesViewController
        vc.nativeAdUtility = nativeAdUtility
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnRacingGameTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "RacingGamesViewController") as! RacingGamesViewController
        vc.nativeAdUtility = nativeAdUtility
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnMindGameTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "MindGamesViewController") as! MindGamesViewController
        vc.nativeAdUtility = nativeAdUtility
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func btnCardGameTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CardGamesViewController") as! CardGamesViewController
        vc.nativeAdUtility = nativeAdUtility
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cotegoryImageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.categoryImageView.image = UIImage(named: cotegoryImageArr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWith = collectionView.bounds.width
        
        return CGSize(width: collectionWith/3 - 5, height: collectionWith/3 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

