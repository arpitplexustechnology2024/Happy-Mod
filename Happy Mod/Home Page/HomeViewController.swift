//
//  HomeViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 02/07/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeCollectionview: UICollectionView!
    @IBOutlet weak var categorybutton: UIButton!
    @IBOutlet weak var popular_GamesButton: UIButton!
    @IBOutlet weak var playGamesButton: UIButton!
    @IBOutlet weak var playGames_WinCashButton: UIButton!
    @IBOutlet weak var new_GamesButton: UIButton!
    
    var homeImageArr = ["Homepage01","Homepage02","Homepage03","Homepage04","Homepage05","Homepage06","Homepage07","Homepage08","Homepage09"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeCollectionview.delegate = self
        homeCollectionview.dataSource = self
        self.categorybutton.layer.cornerRadius = 10
        self.popular_GamesButton.layer.cornerRadius = 10
        self.playGamesButton.layer.cornerRadius = 10
        self.playGames_WinCashButton.layer.cornerRadius = 10
        self.new_GamesButton.layer.cornerRadius = 10
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ThankYouViewController") as! ThankYouViewController
        self.navigationController?.pushViewController(vc, animated: true)

    }
    
    @IBAction func btnCategoryTapped(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CategoryViewController") as! CategoryViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeImageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.homeImageView.image = UIImage(named: homeImageArr[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWith = collectionView.bounds.width
        
        return CGSize(width: collectionWith/3 - 10, height: collectionWith/3 - 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
