//
//  MindGamesViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 03/07/24.
//

import UIKit

class MindGamesViewController: UIViewController {
    
    @IBOutlet weak var mindGameCollectionview01: UICollectionView!
    @IBOutlet weak var mindGameCollectionView02: UICollectionView!
    @IBOutlet weak var adsView: UIView!
    private var nativeAdUtility: NativeAdUtility?
    
    var imageArr = ["Play Cricket","Win Cricket","Pets Rush","Tower Crash 3D"]
    var imageeArr = ["Park Your Car","Element Balls"]
    var nameArr = ["Play Cricket","Win Cricket","Pets Rush","Tower Crash 3D"]
    var nameeArr = ["Park Your Car","Element Balls"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.mindGameCollectionview01.delegate = self
        self.mindGameCollectionView02.delegate = self
        self.mindGameCollectionview01.dataSource = self
        self.mindGameCollectionView02.dataSource = self
        nativeAdUtility = NativeAdUtility(adUnitID: "ca-app-pub-3940256099942544/3986624511", rootViewController: self, nativeAdPlaceholder: adsView)
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

}


extension MindGamesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count:Int?
        
        if collectionView == self.mindGameCollectionview01 {
            count = imageArr.count
        }
        
        if collectionView == self.mindGameCollectionView02 {
            count =  imageeArr.count
        }
        
        return count!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.mindGameCollectionview01 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MindGamesCell01", for: indexPath) as! MindGamesCell01
            cell.mindGameImageView.image = UIImage(named: imageArr[indexPath.row])
            cell.mindGameLabel.text = nameArr[indexPath.row]
            return cell
        }
        
        if collectionView == self.mindGameCollectionView02 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MindGamesCell02", for: indexPath) as! MindGamesCell02
            cell.mindGameImageView.image = UIImage(named: imageeArr[indexPath.row])
            cell.mindGameLabel.text = nameeArr[indexPath.row]
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
