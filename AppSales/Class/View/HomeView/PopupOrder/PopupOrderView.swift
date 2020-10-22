//
//  PopupOrderView.swift
//  AppSales
//
//  Created by Apple on 10/22/20.
//

import UIKit

class PopupOrderView: UIView {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbPoint: UILabel!
    @IBOutlet weak var lbOldPrice: UILabel!
    @IBOutlet weak var lbNewPrice: UILabel!
    @IBOutlet weak var myCollection1: UICollectionView!
    @IBOutlet weak var myCollection2: UICollectionView!
    @IBOutlet weak var lbNumber: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
    
    let arrTitleColor = ["Đen","Trắng","Đỏ","Vàng"]
    let arrColor = ["black","white","red","yellow"]
    let arrSize = ["S","M","L","XL"]
    
    var number : Int = 0
    {
        didSet{
            lbNumber.text = "\(number)"
        }
    }
    
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
        myCollection1.register(UINib.init(nibName: "PopupOderCell1", bundle: nil), forCellWithReuseIdentifier: "PopupOderCell1")
        myCollection2.register(UINib.init(nibName: "PopupOrderCell2", bundle: nil), forCellWithReuseIdentifier: "PopupOrderCell2")
        btnAddToCart.layer.cornerRadius = 5
        btnAddToCart.layer.masksToBounds = true
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func removeNumber(_ sender: Any) {
        number -= 1
    }
    @IBAction func addNumber(_ sender: Any) {
        number += 1
    }
    @IBAction func addToCart(_ sender: Any) {
    }
}

//MARK:-
//MARK: collection
extension PopupOrderView : UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var count = 4
//        if collectionView == self.myCollection1 {
//            count = 4
//        } else {
//            count = 5
//        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        if collectionView == self.myCollection1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupOderCell1", for: indexPath) as! PopupOderCell1
            let typeColor = arrColor[indexPath.row]
            let titleColor = arrTitleColor[indexPath.row]
            //cell.viewCell.backgroundColor = UIColor.typeColor
            cell.lbName.text = titleColor
            cell.conFig()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopupOrderCell2", for: indexPath) as! PopupOrderCell2
            cell.conFig()
            let typeSize = arrSize[indexPath.row]
            cell.lbSize.text = typeSize
            return cell
        }
        return UICollectionViewCell.init()
    }
}

//MARK:-
extension PopupOrderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width : CGFloat = 40
        var height: CGFloat = 52
        if collectionView == self.myCollection1 {
            width = 40
            height = 52
        } else {
            width = 40
            height = 40
        }
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
