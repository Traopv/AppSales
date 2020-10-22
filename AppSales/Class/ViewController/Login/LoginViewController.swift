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
        
//        let userName = txtPhone.text ?? ""
//        let password = txtPass.text ?? ""
//        if(userName.count == 0){
//            VTBase.showToastWithMessage(message: "Vui lòng nhập tên đăng nhập")
//            return
//        }
//        if(password.count == 0){
//            VTBase.showToastWithMessage(message: "Vui lòng nhập mật khẩu")
//            return
//        }
//        VTBase.showLoading()
//        HAPI.requestLoginByUserName(userName: userName, password: password, completion: { (responseData) in
//            print("login success: ", responseData)
//            VTBase.hideLoading()
//            if let data = responseData.object(forKey: "data") as? NSDictionary
//            {
//                if let token = data.object(forKey: "token") as? String
//                {
//                    AppManager.shared.authorToken = token
//                }
//                if let user = data.object(forKey: "user") as? NSDictionary
//                {
//                    AppManager.shared.userInfo = user
//                }
//            }
//            //đăng nhập thành công thì lưu lại tên đăng nhập, mật khẩu để lần sau đỡ phải gõ
//            let defaults = UserDefaults.standard
//            defaults.set(userName, forKey: AppManager.shared.userNameKey)
//            defaults.set(password, forKey: AppManager.shared.passwordKey)
//            defaults.synchronize()
//            //Go to home
////            if let window = UIApplication.shared.windows.first {
////                           let tabbarVC = TabbarViewController.init()
////                           let menuVC = SideMenuViewController.init()
////                           window.rootViewController = SideMenuController(contentViewController: tabbarVC, menuViewController: menuVC)
////                       }
//            let tabbarVC = TabbarViewController.init()
//            self.navigationController?.pushViewController(tabbarVC, animated: false)
//
//        }) { (error) in
//            print("==> login error : ", error)
//        }
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
