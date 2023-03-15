//
//  HomeVc.swift
//  DemoVIPER
//
//  Created by mac on 14/03/23.
//

import UIKit

class HomeVc: BaseVc {
    //MARK: - @IBOutlet
    @IBOutlet weak var lblWelcomHime: UILabel!
    
    //MARK: - Properties
    var presenter: HomeViewToPresenterProtocol?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - @IBAction
    @IBAction func onTapBtnSelectDate(_ sender: Any) {
        presenter?.showDatePopUp()
    }
    
    //MARK: - Functions
}

extension HomeVc: HomePresenterToViewProtocol {
    var selectedDate: Date? {
        get {
            return lblWelcomHime.text?.toDate("dd/MM/yyyy")
        }
        set {
            lblWelcomHime.text = newValue?.toString(format: "dd/MM/yyyy")
        }
    }
}

