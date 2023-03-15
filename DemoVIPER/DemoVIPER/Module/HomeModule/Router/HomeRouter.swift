//
//  HomeRouter.swift
//  DemoVIPER
//
//  Created by mac on 14/03/23.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocole {
    var vc: HomePresenterToViewProtocol
    
    init(vc: HomePresenterToViewProtocol) {
        self.vc = vc
    }
    
    static func createHomeModedule() -> UIViewController {
        let homeVc: HomeVc = HomeVc.instantiate()
        let interactor: HomePreseneterToInteractorProtocol = HomeInteractor()
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let router: HomePresenterToRouterProtocole = HomeRouter(vc: homeVc)
        homeVc.presenter = presenter
        presenter.view = homeVc
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return homeVc
    }
    
    func presentDatePopUp(from vc: HomePresenterToViewProtocol) {
        let datePickerVc = DatePickerRouter.createDatePickerModule()
        datePickerVc.modalPresentationStyle = .overFullScreen
        datePickerVc.modalTransitionStyle = .crossDissolve
        if let datePickerVc = datePickerVc as? DatePickerVc {
            datePickerVc.preseneter?.selectedDate = vc.selectedDate
            datePickerVc.preseneter?.delegate = self
        }
        if let vc = vc as? UIViewController {
            vc.present(datePickerVc, animated: true, completion: nil)
        }
    }
}

extension HomeRouter: DatePickerDelegate {
    func didSelectDate(date: Date) {
        vc.selectedDate = date
    }
}
