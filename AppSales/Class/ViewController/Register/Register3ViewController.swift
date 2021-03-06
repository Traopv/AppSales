//
//  Register3ViewController.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class Register3ViewController: UIViewController {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtRePass: UITextField!
    @IBOutlet weak var btnConfirm: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewLogin: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: conFig
    func conFig(){
        btnConfirm.layer.cornerRadius = 5
        btnConfirm.layer.masksToBounds = true
        viewLogin.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func conFirmPassword(_ sender: Any) {
        
    }
    @IBAction func pushToLogin(_ sender: Any) {
        let loginVC = LoginViewController.init()
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
}
