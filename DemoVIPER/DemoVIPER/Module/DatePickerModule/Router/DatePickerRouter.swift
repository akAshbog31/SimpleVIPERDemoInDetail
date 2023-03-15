//
//  DatePickerRouter.swift
//  DemoVIPER
//
//  Created by mac on 15/03/23.
//

import UIKit

class DatePickerRouter: DatePickerPresenterToRouterProtocol {
    static func createDatePickerModule() -> UIViewController {
        let datePickerVc: DatePickerVc = DatePickerVc.instantiate()
        var interactor: DatePickerPresenterToInteractorProtocol = DatePickerInteractor()
        let presenter: DatePickerViewToPresenterProtocol & DatePickerInteractorToPresenterProtocol = DatePickerPresenter()
        let router: DatePickerPresenterToRouterProtocol = DatePickerRouter()
        datePickerVc.preseneter = presenter
        presenter.view = datePickerVc
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return datePickerVc
    }
    
    func dismissDatePicker(from vc: DatePickerPresenterToViewProtocol) {
        if let vc = vc as? UIViewController {
            vc.dismiss(animated: true, completion: nil)
        }
    }
}
