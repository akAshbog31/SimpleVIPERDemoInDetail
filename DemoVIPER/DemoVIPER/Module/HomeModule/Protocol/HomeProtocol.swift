//
//  HomeProtocol.swift
//  DemoVIPER
//
//  Created by mac on 14/03/23.
//

import UIKit

protocol HomePresenterToViewProtocol: AnyObject {
    var selectedDate: Date? { get set }
}

protocol HomePreseneterToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
}

protocol HomePresenterToRouterProtocole {
    var vc: HomePresenterToViewProtocol { get set }
    
    static func createHomeModedule() -> UIViewController
    
    func presentDatePopUp(from vc: HomePresenterToViewProtocol)
}

protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePreseneterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocole? { get set }
    
    func showDatePopUp()
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    
}
