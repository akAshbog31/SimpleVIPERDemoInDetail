//
//  DatePickerProtocol.swift
//  DemoVIPER
//
//  Created by mac on 15/03/23.
//

import UIKit

protocol DatePickerPresenterToViewProtocol: AnyObject {

}

protocol DatePickerPresenterToInteractorProtocol {
    var presenter: DatePickerInteractorToPresenterProtocol? { get set }
}

protocol DatePickerPresenterToRouterProtocol {
    static func createDatePickerModule() -> UIViewController
    
    func dismissDatePicker(from vc: DatePickerPresenterToViewProtocol)
}

protocol DatePickerViewToPresenterProtocol: AnyObject {
    var view: DatePickerPresenterToViewProtocol? { get set }
    var interactor: DatePickerPresenterToInteractorProtocol? { get set }
    var router: DatePickerPresenterToRouterProtocol? { get set }
    var selectedDate: Date? { get set }
    var delegate: DatePickerDelegate? { get set }
    
    func dismisDatePopUp()
}

protocol DatePickerInteractorToPresenterProtocol: AnyObject {
    
}

protocol DatePickerDelegate: AnyObject {
    func didSelectDate(date: Date)
}
