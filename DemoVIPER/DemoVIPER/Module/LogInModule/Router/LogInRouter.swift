//
//  LogInRouter.swift
//  DemoVIPER
//
//  Created by mac on 10/03/23.
//

import UIKit

class LogInRouter: LogInPresenterToRouterProtoCol {
    static func createLogInModule() -> UIViewController {
        let logInVc: LogInVc = LogInVc.instantiate()
        let presenter: LogInViewToPresenterProtocol & LogInIntractorToPresenterProtocol = LogInPresenter()
        var interactor: LogInPresenterToInteractorProtocol = LogInInteractor()
        let router: LogInPresenterToRouterProtoCol = LogInRouter()
        logInVc.presenter = presenter
        presenter.view = logInVc
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return logInVc
    }
    
    func gotoSignUpVc(from vc: LogInPresenterToViewProtocol) {
        let signUpVc = SignUpRouter.createSignUpModule()
        if let vc = vc as? UIViewController {
            vc.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
    
    func gotoHomeVc(from vc: LogInPresenterToViewProtocol) {
        let homeVc = HomeRouter.createHomeModedule()
        if let vc = vc as? UIViewController {
            vc.navigationController?.pushViewController(homeVc, animated: true)
        }
    }
}
