//
//  TicketListTableViewCell.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import UIKit

final class TicketListTableViewCell: UITableViewCell {
    
    private var ticketInfo: TicketInfo?
    
    
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet private weak var departure: UILabel!
    @IBOutlet private weak var departureCode: UILabel!
    @IBOutlet private weak var destination: UILabel!
    @IBOutlet private weak var destinationCode: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDate() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let currentDateString = dateFormatter.string(from: currentDate)
        dataLabel.text = currentDateString
    }
    
    func setDataLabel(_ dateString: String) {
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
