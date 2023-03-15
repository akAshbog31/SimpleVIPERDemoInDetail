//
//  SignUpRouter.swift
//  DemoVIPER
//
//  Created by mac on 13/03/23.
//

import UIKit

class SignUpRouter: SignUpPresenterToRouterProtocol {
    static func createSignUpModule() -> UIViewController {
        let signUpVc: SignUpVc = SignUpVc.instantiate()
        var presenter: SignUpViewToPresenterProtocol & SignUpIntractorToPresenterProtocol = SignUpPresenter()
        let interactor: SignUpPresenterToInteractorProtocol = SignUpIntractor()
        let router: SignUpPresenterToRouterProtocol = SignUpRouter()
        signUpVc.presenter = presenter
        presenter.view = signUpVc
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return signUpVc
    }
    
    func popToLogInVc(from vc: SignUpPresenterToViewProtocol) {
        if let vc = vc as? UIViewController {
            vc.navigationController?.popViewController(animated: true)
        }
    }
    
    func pushToLogInVc(from vc: SignUpPresenterToViewProtocol) {
        let logInVc = LogInRouter.createLogInModule()
        if let vc = vc as? UIViewController {
            vc.navigationController?.pushViewController(logInVc, animated: true)
        }
    }
}
