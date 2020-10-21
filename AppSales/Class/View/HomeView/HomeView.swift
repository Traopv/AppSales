//
//  HomeView.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class HomeView: UIView {

    @IBOutlet weak var myTable: UITableView!
    
    func fromNib(nibName : String, index : Int! = 0) -> UIView {
        let bundle = Bundle.main
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil)[index] as! UIView
        
        return nibView
    }
    
    //MARK:-
    //MARK: config
    func conFig() {
        myTable.register(UINib.init(nibName: "HomeTBCell", bundle: nil), forCellReuseIdentifier: "HomeTBCell")
    }
}

//MARK:-
//MARK: Table
extension HomeView : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let topHeaderHomeTbCell = TopHeaderHomeTBCell().fromNib(nibName: "TopHeaderHomeTBCell") as! TopHeaderHomeTBCell
            topHeaderHomeTbCell.conFig()
            return topHeaderHomeTbCell
        } else {
            let headerHomeTbCell = HeaderHomeTBCell().fromNib(nibName: "HeaderHomeTBCell") as! HeaderHomeTBCell
            headerHomeTbCell.frame = CGRect(x: 0, y: 0, width: VTConstants.ScreenSize.SCREEN_WIDTH, height: 36)
            return headerHomeTbCell
        }
        return UIView.init()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var number = 0
        if indexPath.section == 0 {
            number = 0
        } else {
            number = 404
        }
        return CGFloat(number)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var number = 0
        if section == 0 {
            number = 203
        } else {
            number = 52
        }
        return CGFloat(number)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return UITableViewCell.init()
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTBCell", for: indexPath) as! HomeTBCell
            cell.conFig()
            return cell
        }
    }
}
