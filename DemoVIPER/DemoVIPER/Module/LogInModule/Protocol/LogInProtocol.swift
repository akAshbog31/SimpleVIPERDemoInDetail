//
//  LogInProtocol.swift
//  DemoVIPER
//
//  Created by mac on 10/03/23.
//

import UIKit

protocol LogInPresenterToViewProtocol: AnyObject {
    func showLoader(isLoading: Bool)
    func showError(error: String)
    func userLogin()
}

protocol LogInPresenterToInteractorProtocol {
    var presenter: LogInIntractorToPresenterProtocol? { get set }
    
    func doLogIn(using email: String, password: String)
}

protocol LogInIntractorToPresenterProtocol: AnyObject {
    func loading(isLoading: Bool)
    func userLoginError(error: String)
    func userLoginSuccessfully()
}

protocol LogInViewToPresenterProtocol: AnyObject {
    var view: LogInPresenterToViewProtocol? { get set }
    var interactor: LogInPresenterToInteractorProtocol? { get set }
    var router: LogInPresenterToRouterProtoCol? { get set }
    
    func onTapLogin(email: String, password: String)
    func onTapSignIn()
    func logInSuccess()
}

protocol LogInPresenterToRouterProtoCol {
    static func createLogInModule() -> UIViewController
    
    func gotoSignUpVc(from vc: LogInPresenterToViewProtocol)
    func gotoHomeVc(from vc: LogInPresenterToViewProtocol)
}
