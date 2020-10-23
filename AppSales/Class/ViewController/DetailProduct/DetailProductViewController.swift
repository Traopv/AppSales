//
//  DetailProductViewController.swift
//  AppSales
//
//  Created by Apple on 10/23/20.
//

import UIKit

class DetailProductViewController: UIViewController {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbNameProduct: UILabel!
    @IBOutlet weak var lbOldPrice: UILabel!
    @IBOutlet weak var lbNewPrice: UILabel!
    @IBOutlet weak var btnAddToCart: UIButton!
    @IBOutlet weak var viewCart: UIView!
    @IBOutlet weak var lbDicription: UILabel!
    @IBOutlet weak var myCollection: UICollectionView!
    @IBOutlet weak var lbNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
        btnAddToCart.layer.cornerRadius = 5
        btnAddToCart.layer.masksToBounds = true
        viewCart.layer.cornerRadius = 5
        viewCart.layer.masksToBounds = true
        viewCart.layer.borderWidth = 0.5
        viewCart.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lbNumber.layer.cornerRadius = 5
        lbNumber.layer.masksToBounds = true
        
        myCollection.register(UINib.init(nibName: "VideoCollectionCell", bundle: nil), forCellWithReuseIdentifier: "VideoCollectionCell")
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func backScreen(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnCart(_ sender: Any) {
    }
    @IBAction func btnLike(_ sender: Any) {
    }
    @IBAction func btnSent(_ sender: Any) {
    }
    @IBAction func addToCart(_ sender: Any) {
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
    
    @IBAction func goToCart(_ sender: Any) {
    }
}

//MARK:-
extension DetailProductViewController : UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionCell", for: indexPath) as! VideoCollectionCell
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetX = myCollection.contentOffset.x
        if offsetX < scrollView.bounds.width {
            
            if offsetX == 0 {
                lbNumber.text = "\(Int(offsetX + 1)) / 5"
            }
        } else {
            var index: Int = Int(offsetX/scrollView.bounds.width)
            lbNumber.text = "\(index + 1) / 5"
        }
    }
}

//MARK:-
extension DetailProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

