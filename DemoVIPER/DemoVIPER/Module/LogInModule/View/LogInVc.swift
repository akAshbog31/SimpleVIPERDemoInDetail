//
//  ViewController.swift
//  DemoVIPER
//
//  Created by mac on 10/03/23.
//

import UIKit

class LogInVc: BaseVc {
    //MARK: - @IBOutlet
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnEye: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var viewLogIn: UIView!
    @IBOutlet weak var viewEmail: UIView!
    @IBOutlet weak var viewPassword: UIView!
    
    //MARK: - Properties
    var presenter: LogInViewToPresenterProtocol?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUi()
    }
    
    //MARK: - @IBAction
    @IBAction func btnSignUp(_ sender: Any) {
        presenter?.onTapSignIn()
    }
    
    @IBAction func onTapBtnLogIn(_ sender: Any) {
        guard let email = txtEmail.text, !email.isEmpty else {
            showAlert(msg: "Please enter valid email")
            return
        }
        
        guard let password = txtPassword.text, !password.isEmpty else {
            showAlert(msg: "Please enter valid password")
            return
        }
        
        presenter?.onTapLogin(email: email, password: password)
    }
    
    @IBAction func onTapBtnEye(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        txtPassword.isSecureTextEntry = !sender.isSelected
    }
    
    //MARK: - Functions
    private func setUpUi() {
        viewLogIn.layer.cornerRadius = 12
        viewEmail.layer.cornerRadius = 12
        viewPassword.layer.cornerRadius = 12
        btnEye.isSelected = false
        viewEmail.setShadow(shadowColor: .gray)
        viewPassword.setShadow(shadowColor: .gray)
    }
}

extension LogInVc: LogInPresenterToViewProtocol {
    func showLoader(isLoading: Bool) {
        isLoading ? showHUD() : dismissHUD()
    }
    
    func showError(error: String) {
        showAlert(msg: error)
    }
    
    func userLogin() {
        presenter?.logInSuccess()
    }
}

