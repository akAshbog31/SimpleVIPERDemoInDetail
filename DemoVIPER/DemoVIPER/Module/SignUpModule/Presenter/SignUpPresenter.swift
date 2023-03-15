//
//  SignUpPresenter.swift
//  DemoVIPER
//
//  Created by mac on 13/03/23.
//

class SignUpPresenter: SignUpViewToPresenterProtocol {
    weak var view: SignUpPresenterToViewProtocol?
    var interactor: SignUpPresenterToInteractorProtocol?
    var router: SignUpPresenterToRouterProtocol?
    
    func didTapSignUp(name: String, email: String, password: String) {
        interactor?.createUser(name: name, email: email, password: password)
    }
    
    func didTapLogIn() {
        router?.popToLogInVc(from: view!)
    }
    
    func userCreatNavigation() {
        router?.pushToLogInVc(from: view!)
    }
}

extension SignUpPresenter: SignUpIntractorToPresenterProtocol {
    func loading(isLoading: Bool) {
        view?.showLoader(isLoading: isLoading)
    }
    
    func failier(error: String) {
        view?.showError(error: error)
    }
    
    func userCreateSuccessfully() {
        view?.userCreated()
    }
}
