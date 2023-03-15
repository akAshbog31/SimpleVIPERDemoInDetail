//
//  LogInPresenter.swift
//  DemoVIPER
//
//  Created by mac on 10/03/23.
//

import UIKit

class LogInPresenter: LogInViewToPresenterProtocol {
    weak var view: LogInPresenterToViewProtocol?
    var interactor: LogInPresenterToInteractorProtocol?
    var router: LogInPresenterToRouterProtoCol?
    
    func onTapLogin(email: String, password: String) {
        interactor?.doLogIn(using: email, password: password)
    }
    
    func onTapSignIn() {
        router?.gotoSignUpVc(from: view!)
    }
    
    func logInSuccess() {
        router?.gotoHomeVc(from: view!)
    }
}

extension LogInPresenter: LogInIntractorToPresenterProtocol {
    func loading(isLoading: Bool) {
        view?.showLoader(isLoading: isLoading)
    }
    
    func userLoginSuccessfully() {
        view?.userLogin()
    }
    
    func userLoginError(error: String) {
        view?.showError(error: error)
    }
}
