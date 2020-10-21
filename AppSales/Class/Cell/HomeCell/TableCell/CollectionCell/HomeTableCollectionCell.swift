//
//  HomeTableCollectionCell.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class HomeTableCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lbPoint: UILabel!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbOldPrice: UILabel!
    @IBOutlet weak var lbNewPrice: UILabel!
    @IBOutlet weak var lbAddToCart: UIButton!
    @IBOutlet weak var btnAddToCart: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //MARK:-
    //MARK: conFig
    func conFig(){
        btnAddToCart.layer.cornerRadius = 8
        btnAddToCart.layer.masksToBounds = true
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func btnLike(_ sender: Any) {
    }
    
    @IBAction func btnSent(_ sender: Any) {
    }
    
    @IBAction func addToCart(_ sender: Any) {
    }
}
