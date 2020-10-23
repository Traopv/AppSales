//
//  TopHeaderHomeTBCell.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class TopHeaderHomeTBCell: UIView {

    @IBOutlet weak var myCollection: UICollectionView!
    
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
        myCollection.register(UINib.init(nibName: "TopHomeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "TopHomeCollectionCell")
    }
}

//MARK:-
//MARK: collection
extension TopHeaderHomeTBCell : UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopHomeCollectionCell", for: indexPath) as! TopHomeCollectionCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nc = NotificationCenter.default
        nc.post(name: Notification.Name("pushToVideoVC"), object: nil)
    }
}

//MARK:-
extension TopHeaderHomeTBCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = 270
        let height: CGFloat = 210
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
