//
//  TabbarViewController.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class TabbarViewController: UIViewController {

    @IBOutlet weak var viewSegment: UIView!
    @IBOutlet weak var mScroll: UIScrollView!
    
    var segmentControl : HMSegmentedControl!
    
    var viewHome : HomeView!
    var viewProducts : ProductsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()

        DispatchQueue.main.async { // Correct
            self.setupSegmentControl()
        }
    }
    //MARK:
    //MARK: conFig
    func conFig(){
        viewSegment.layer.shadowColor = UIColor.black.cgColor
        viewSegment.layer.shadowOpacity = 0.3
        viewSegment.layer.shadowRadius = 2
        viewSegment.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(handlePushToVideoVC), name: Notification.Name("pushToVideoVC"), object: nil)
    }
    
    @objc  func handlePushToVideoVC(){
        DispatchQueue.main.async {
            let videoVC = VideoViewController.init()
            self.navigationController?.pushViewController(videoVC, animated: false)
        }
    }
    
    //MARK:-
    //MARK: SETUP SEGMENT
    func setupSegmentControl(){
        let titles : [String] = ["Home", "Sản phẩm", "Đơn hàng", "Thông báo", "Tài khoản"]
        let images : [UIImage] = [UIImage.init(named: "iconHome1.png")!, UIImage.init(named: "iconHome2.png")!, UIImage.init(named: "iconHome3.png")!, UIImage.init(named: "iconHome4.png")!, UIImage.init(named: "iconHome5.png")!]
        let selectedImages : [UIImage] = [UIImage.init(named: "iconHomeSelected1.png")!, UIImage.init(named: "iconHomeSelected2.png")!, UIImage.init(named: "iconHomeSelected3.png")!, UIImage.init(named: "iconHomeSelected4.png")!, UIImage.init(named: "iconHomeSelected5.png")!]
        segmentControl = HMSegmentedControl.init(sectionImages: images, sectionSelectedImages: selectedImages, titlesForSections: titles)
        segmentControl.backgroundColor = .clear
        segmentControl.selectionIndicatorColor = .clear
        segmentControl.selectionIndicatorHeight = 0
        segmentControl.selectionIndicatorLocation = .none
        segmentControl.selectionStyle = .fullWidthStripe;
        segmentControl.delegate = self
        segmentControl.selectionIndicatorBoxOpacity = 0.0
        segmentControl.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor.rawValue: UIColor.black
            ,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11)
        ]
        segmentControl.selectedTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor.rawValue: UIColor.red
            ,NSAttributedString.Key.font : UIFont.systemFont(ofSize: 11)
        ]
       
        let width = VTConstants.ScreenSize.SCREEN_WIDTH
        let rect = CGRect(x: 0, y: 7, width: width, height: 50)
        segmentControl.frame = rect
        self.viewSegment.addSubview(segmentControl)
        
        self.mScroll.contentSize = CGSize(width: 5 * width, height: self.mScroll.frame.size.height)
        
        viewHome = HomeView().fromNib(nibName: "HomeView") as? HomeView
        viewHome.frame =  CGRect(x: 0, y: 0, width: width, height: self.mScroll.frame.size.height)
        viewHome.conFig()
        self.mScroll.addSubview(viewHome)
//
        viewProducts = ProductsView().fromNib(nibName: "ProductsView") as? ProductsView
        viewProducts.frame =  CGRect(x: width, y: 0, width: width, height: self.mScroll.frame.size.height)
        self.mScroll.addSubview(viewProducts)
////
//        viewMatching = MatchingView().fromNib(nibName: "MatchingView") as? MatchingView
//        viewMatching.frame =  CGRect(x: 2 * width, y: 0, width: width, height: self.mScroll.frame.size.height)
//        viewMatching.configViewUI()
//        self.mScroll.addSubview(viewMatching)
//
//        viewAddon = AddonView().fromNib(nibName: "AddonView") as? AddonView
//        viewAddon.frame =  CGRect(x: 3 * width, y: 0, width: width, height: self.mScroll.frame.size.height)
//        viewAddon.configViewUI()
//        self.mScroll.addSubview(viewAddon)
        
        segmentControl.setSelectedSegmentIndex(0, animated: false)
        
        segmentControl.indexChangeBlock = {index in
            self.mScroll.scrollRectToVisible(CGRect(x: CGFloat(self.segmentControl.selectedSegmentIndex) * width, y: 0, width: width, height: self.mScroll.frame.size.height), animated: true)
        }
        viewSegment.bringSubviewToFront(segmentControl)
    }

}

extension TabbarViewController : UIScrollViewDelegate{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.x
        let page = UInt(y / VTConstants.ScreenSize.SCREEN_WIDTH)
        self.segmentControl.setSelectedSegmentIndex(page, animated: true)
    }
}

extension TabbarViewController : HMSegmentedControlDelegate
{
    //SEGMENT CONTROL DELEGATE
    func hmSegmentControlWillSelectedIndex(_ index: Int32) {
        
    }
    func selectSegment(index : Int){
        
    }
    
}
