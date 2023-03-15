//
//  HomePresenter.swift
//  DemoVIPER
//
//  Created by mac on 14/03/23.
//

import Foundation

class HomePresenter: HomeViewToPresenterProtocol {
    weak var view: HomePresenterToViewProtocol?
    var interactor: HomePreseneterToInteractorProtocol?
    var router: HomePresenterToRouterProtocole?
    
    func showDatePopUp() {
        router?.presentDatePopUp(from: view!)
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    
}
