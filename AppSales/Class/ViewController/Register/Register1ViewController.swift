//
//  Register1ViewController.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class Register1ViewController: UIViewController {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewLogin: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: conFig
    func conFig(){
        txtPhone.layer.cornerRadius = 5
        txtPhone.layer.borderWidth = 1
        txtPhone.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        txtPhone.layer.masksToBounds = true
        btnNext.layer.cornerRadius = 5
        btnNext.layer.masksToBounds = true
        viewLogin.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func nextScreen(_ sender: Any) {
        let register2VC = Register2ViewController.init()
        self.navigationController?.pushViewController(register2VC, animated: false)
    }
    @IBAction func pushToLogin(_ sender: Any) {
        let loginVC = LoginViewController.init()
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
}
