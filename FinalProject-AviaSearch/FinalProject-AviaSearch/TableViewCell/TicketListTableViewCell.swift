//
//  TicketListTableViewCell.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import UIKit

final class TicketListTableViewCell: UITableViewCell {
    
    private let viewModel = TicketListViewModel()
    
    @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet private weak var departure: UILabel!
    @IBOutlet private weak var departureCode: UILabel!
    @IBOutlet private weak var destination: UILabel!
    @IBOutlet private weak var destinationCode: UILabel!
    
    private func setCurrentDate() {
        let selectedDate = Date()
        let currentDateString = String.formatDate(with: selectedDate)
        dataLabel.text = currentDateString
    }
    
    func setDataLabel(with selectedDate: Date) {
        let dateString = String.formatDate(with: selectedDate)
        dataLabel.text = dateString
    }
    
    func configure(with ticketInfo: TicketInfo) {
        departure.text = ticketInfo.departure
        departureCode.text = ticketInfo.departureCode
        destination.text = ticketInfo.destination
        destinationCode.text = ticketInfo.destinationCode
        dataLabel.text = ticketInfo.date
    }
}
