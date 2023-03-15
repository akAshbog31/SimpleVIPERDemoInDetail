//
//  DatePickerVc.swift
//  DemoVIPER
//
//  Created by mac on 15/03/23.
//

import UIKit

class DatePickerVc: BaseVc {
    //MARK: - @IBOutlet
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var bgView: UIView!
    
    //MARK: - Properties
    var preseneter: DatePickerViewToPresenterProtocol?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUi()
    }
    
    deinit {
        print("Calllllll.............")
    }
    
    //MARK: - @IBAction
    @IBAction func onTapBtnBg(_ sender: Any) {
        preseneter?.dismisDatePopUp()
    }
    
    @objc func handleDatePicker(sender: UIDatePicker) {
        let changedDay: Bool = Calendar.current.component(.day, from: preseneter?.selectedDate ?? Date()) != Calendar.current.component(.day, from: sender.date)
        guard changedDay else { return }
        preseneter?.delegate?.didSelectDate(date: sender.date)
        preseneter?.dismisDatePopUp()
    }
    
    //MARK: - Functions
    private func setUi() {
        bgView.layer.cornerRadius = 12
        datePicker.addTarget(self, action: #selector(handleDatePicker(sender:)), for: .valueChanged)
        if let date = preseneter?.selectedDate {
            datePicker?.setDate(date, animated: true)
        }
    }
}

//MARK: - DatePickerPresenterToViewProtocol
extension DatePickerVc: DatePickerPresenterToViewProtocol {
    
}
