//
//  Register2ViewController.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class Register2ViewController: UIViewController {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtOTP: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
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
        txtOTP.layer.cornerRadius = 5
        txtOTP.layer.borderWidth = 1
        txtOTP.layer.borderColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        txtOTP.layer.masksToBounds = true
        btnRegister.layer.cornerRadius = 5
        btnRegister.layer.masksToBounds = true
        viewLogin.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func register(_ sender: Any) {
        let register3VC = Register3ViewController.init()
        self.navigationController?.pushViewController(register3VC, animated: false)
    }
    @IBAction func pushToLogin(_ sender: Any) {
        let loginVC = LoginViewController.init()
        self.navigationController?.pushViewController(loginVC, animated: false)
    }
}
