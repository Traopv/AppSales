//
//  HeaderHomeTBCell.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class HeaderHomeTBCell: UIView {

    @IBOutlet weak var lbTitle: UILabel!
    
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
    }
}
