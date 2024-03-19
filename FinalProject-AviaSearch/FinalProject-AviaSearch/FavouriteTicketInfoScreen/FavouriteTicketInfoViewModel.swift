//
//  FavouriteTicketInfoViewModel.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 19.03.24.
//

import Foundation

final class FavouriteTicketInfoViewModel {

    var ticketInfo: TicketInfo?
        
    func configureTicketInfo(with ticketInfo: TicketInfo) {
        self.ticketInfo = ticketInfo
    }
        
    func deleteTicket() {
        guard let ticketInfo = ticketInfo else { return }
        CoreDataService.shared.deleteFavouriteTicket(ticket: ticketInfo)
    }
}
