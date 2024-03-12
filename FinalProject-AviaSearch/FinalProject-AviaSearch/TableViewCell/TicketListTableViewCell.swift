//
//  TicketListTableViewCell.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import UIKit

final class TicketListTableViewCell: UITableViewCell {
    
    private var ticketInfo: TicketInfo?
    private var dateString: String?
    private var selectedDate: Date?
    
    
    @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet private weak var departure: UILabel!
    @IBOutlet private weak var departureCode: UILabel!
    @IBOutlet private weak var destination: UILabel!
    @IBOutlet private weak var destinationCode: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDataLabel(with selectedDate: Date) {
        let dateFormatter = DateFormatter() //extension dateformater
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dateFormatter.string(from: selectedDate)
        dataLabel.text = dateString
    }
    
    func setDate() {
        let selectedDate = Date() //extension dateformater
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currentDateString = dateFormatter.string(from: selectedDate)
        dataLabel.text = currentDateString
    }
    
    func configure(with ticketInfo: TicketInfo) {
        departure.text = ticketInfo.departure
        departureCode.text = ticketInfo.departureCode
        destination.text = ticketInfo.destination
        destinationCode.text = ticketInfo.destinationCode
        dataLabel.text = ticketInfo.date
    }
    
 
    
}
