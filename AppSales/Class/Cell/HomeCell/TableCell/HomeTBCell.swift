//
//  HomeTBCell.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class HomeTBCell: UITableViewCell {

    @IBOutlet weak var myCollection: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
        myCollection.register(UINib.init(nibName: "HomeTableCollectionCell", bundle: nil), forCellWithReuseIdentifier: "HomeTableCollectionCell")
    }
}

//MARK:-
//MARK: collection
extension HomeTBCell : UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeTableCollectionCell", for: indexPath) as! HomeTableCollectionCell
        cell.conFig()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let  popupOrderView : PopupOrderView = PopupOrderView().fromNib(nibName: "PopupOrderView", index: 0) as! PopupOrderView
        popupOrderView.conFig()
        popupOrderView.frame = CGRect(x: VTConstants.ScreenSize.SCREEN_HEIGHT, y: 0, width: VTConstants.ScreenSize.SCREEN_WIDTH, height: VTConstants.ScreenSize.SCREEN_HEIGHT * 0.6)
        popupOrderView.layer.cornerRadius = 15
        popupOrderView.layer.masksToBounds = true
        let klc = KLCPopup.init(contentView: popupOrderView)
        klc?.showType = .fadeIn
        klc?.dismissType = .shrinkOut
        klc?.maskType = .dimmed
        klc?.shouldDismissOnBackgroundTouch = true
        klc?.show()
    }
}

//MARK:-
extension HomeTBCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width : CGFloat = 219
        let height: CGFloat = 417
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
