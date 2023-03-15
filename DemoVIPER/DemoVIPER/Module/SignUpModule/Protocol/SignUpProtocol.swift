//
//  SignUpProtocol.swift
//  DemoVIPER
//
//  Created by mac on 13/03/23.
//

import UIKit

protocol SignUpViewToPresenterProtocol {
    var view: SignUpPresenterToViewProtocol? { get set }
    var interactor: SignUpPresenterToInteractorProtocol? { get set }
    var router: SignUpPresenterToRouterProtocol? { get set }
    
    func didTapSignUp(name: String, email: String, password: String)
    func didTapLogIn()
    func userCreatNavigation()
}

protocol SignUpIntractorToPresenterProtocol: AnyObject {
    func loading(isLoading: Bool)
    func failier(error: String)
    func userCreateSuccessfully()
}

protocol SignUpPresenterToViewProtocol: AnyObject {
    func showLoader(isLoading: Bool)
    func showError(error: String)
    func userCreated()
}

protocol SignUpPresenterToInteractorProtocol: AnyObject {
    var presenter: SignUpIntractorToPresenterProtocol? { get set }
    
    func createUser(name: String, email: String, password: String)
    func addUser(model: UserProfileModel, userId: String)
}

protocol SignUpPresenterToRouterProtocol {
    static func createSignUpModule() -> UIViewController
    
    func popToLogInVc(from vc: SignUpPresenterToViewProtocol)
    func pushToLogInVc(from vc: SignUpPresenterToViewProtocol)
}
