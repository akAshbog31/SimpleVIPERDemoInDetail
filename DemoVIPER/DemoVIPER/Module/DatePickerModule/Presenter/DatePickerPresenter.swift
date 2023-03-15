//
//  DatePickerPresenter.swift
//  DemoVIPER
//
//  Created by mac on 15/03/23.
//

import Foundation

class DatePickerPresenter: DatePickerViewToPresenterProtocol {
    weak var view: DatePickerPresenterToViewProtocol?
    var interactor: DatePickerPresenterToInteractorProtocol?
    var router: DatePickerPresenterToRouterProtocol?
    weak var delegate: DatePickerDelegate?
    var selectedDate: Date?
    
    func dismisDatePopUp() {
        router?.dismissDatePicker(from: view!)
    }
}

extension DatePickerPresenter: DatePickerInteractorToPresenterProtocol {
    
}
