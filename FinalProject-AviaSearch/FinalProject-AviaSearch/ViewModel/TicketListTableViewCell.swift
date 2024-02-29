//
//  TicketListTableViewCell.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import UIKit

final class TicketListTableViewCell: UITableViewCell {
    
    private var ticketInfo: TicketInfo?
    
    @IBOutlet private weak var dataLabel: UILabel!
    @IBOutlet private weak var departure: UILabel!
    @IBOutlet private weak var departureCode: UILabel!
    @IBOutlet private weak var destination: UILabel!
    @IBOutlet private weak var destinationCode: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with ticketInfo: TicketInfo) {
        dataLabel.text = ticketInfo.date
        departure.text = ticketInfo.departure
        departureCode.text = ticketInfo.departureCode
        destination.text = ticketInfo.destination
        destinationCode.text = ticketInfo.destinationCode
    }
 
    
}
