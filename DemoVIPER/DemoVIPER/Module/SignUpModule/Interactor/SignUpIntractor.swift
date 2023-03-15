//
//  SignUpIntractor.swift
//  DemoVIPER
//
//  Created by mac on 13/03/23.
//

class SignUpIntractor: SignUpPresenterToInteractorProtocol {
    weak var presenter: SignUpIntractorToPresenterProtocol?
    
    func createUser(name: String, email: String, password: String) {
        presenter?.loading(isLoading: true)
        FirebaseManager.shared.createUser(email: email, password: password) { [weak self] result in
            self?.presenter?.loading(isLoading: false)
            switch result {
            case .success(let userModel):
                let model = UserProfileModel(name: name, email: userModel.email, id: userModel.id)
                self?.addUser(model: model, userId: userModel.id ?? "")
            case .failure(let error):
                self?.presenter?.failier(error: error.localizedDescription)
            }
        }
    }
    
    func addUser(model: UserProfileModel, userId: String) {
        presenter?.loading(isLoading: true)
        FirebaseManager.shared.addUser(model: model, userId: userId) { [weak self] result in
            self?.presenter?.loading(isLoading: false)
            switch result {
            case .success():
                self?.presenter?.userCreateSuccessfully()
            case .failure(let error):
                self?.presenter?.failier(error: error.localizedDescription)
            }
        }
    }
}
