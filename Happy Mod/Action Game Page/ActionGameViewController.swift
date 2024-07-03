//
//  ActionGameViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 02/07/24.
//

import UIKit

class ActionGameViewController: UIViewController {
    
    @IBOutlet weak var actionGameCollectionview01: UICollectionView!
    @IBOutlet weak var actionGameCollectionView02: UICollectionView!
    @IBOutlet weak var adsView: UIView!
    private var nativeAdUtility: NativeAdUtility?
    
    var imageArr = ["Truck Trials","Boat Battles","Jumo Justin","Canon Soldier"]
    var imageeArr = ["Play Cricket","Win Cricket"]
    var nameArr = ["Truck Trials","Boat Battles","Jumo Justin","Canon Soldier"]
    var nameeArr = ["Play Cricket","Win Cricket"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actionGameCollectionview01.delegate = self
        self.actionGameCollectionView02.delegate = self
        self.actionGameCollectionview01.dataSource = self
        self.actionGameCollectionView02.dataSource = self
        nativeAdUtility = NativeAdUtility(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: self, nativeAdPlaceholder: adsView)
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension ActionGameViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count:Int?
        
        if collectionView == self.actionGameCollectionview01 {
            count = imageArr.count
        }
        
        if collectionView == self.actionGameCollectionView02 {
            count =  imageeArr.count
        }
        
        return count!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.actionGameCollectionview01 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActionGameCell01", for: indexPath) as! ActionGameCell01
            cell.actionGameImageView.image = UIImage(named: imageArr[indexPath.row])
            cell.actionGameLabel.text = nameArr[indexPath.row]
            return cell
        }
        
        if collectionView == self.actionGameCollectionView02 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ActionGameCell02", for: indexPath) as! ActionGameCell02
            cell.actionGameImageView.image = UIImage(named: imageeArr[indexPath.row])
            cell.actionGameLabel.text = nameeArr[indexPath.row]
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "GameStartViewController") as! GameStartViewController
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

