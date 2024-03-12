//
//  TicketListViewModel.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 12.03.24.
//

import UIKit

class TicketListViewModel: UIViewController {

    var selectedDate: Date?  // вью модель ти
    var dateString: String?
    

    //var selectedDate = Date()
    
    @objc func dateDidChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let string = dateFormatter.string(from: selectedDate)
        //textFieldDate.text = dateFormatter.string(from: selectedDate)
        self.selectedDate = selectedDate
        }
}

