//
//  LoginViewController.swift
//  AppSales
//
//  Created by Apple on 10/21/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewRegister: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        conFig()
    }
    
    //MARK:-
    //MARK: conFig
    func conFig(){
        btnLogin.layer.cornerRadius = 5
        btnLogin.layer.masksToBounds = true
        viewRegister.layer.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK:-
    //MARK: button function
    @IBAction func login(_ sender: Any) {
        let tabbarVC = TabbarViewController.init()
        self.navigationController?.pushViewController(tabbarVC, animated: false)
    }
    @IBAction func pushToRegister(_ sender: Any) {
        let registerVC = Register1ViewController.init()
        self.navigationController?.pushViewController(registerVC, animated: false)
    }
    @IBAction func forgotPassword(_ sender: Any) {
    }
    @IBAction func loginWithApple(_ sender: Any) {
    }
    @IBAction func loginWithFacebook(_ sender: Any) {
    }
}
