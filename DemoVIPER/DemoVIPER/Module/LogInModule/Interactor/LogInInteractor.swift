//
//  LogInInteractor.swift
//  DemoVIPER
//
//  Created by mac on 10/03/23.
//

import Foundation

class LogInInteractor: LogInPresenterToInteractorProtocol {
    weak var presenter: LogInIntractorToPresenterProtocol?
    
    func doLogIn(using email: String, password: String) {
        presenter?.loading(isLoading: true)
        FirebaseManager.shared.signIn(email: email, password: password) { [weak self] result in
            self?.presenter?.loading(isLoading: false)
            switch result {
            case .success():
                self?.presenter?.userLoginSuccessfully()
            case .failure(let error):
                self?.presenter?.userLoginError(error: error.localizedDescription)
            }
        }
    }
}
