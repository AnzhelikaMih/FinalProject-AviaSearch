//
//  FavouriteTicketInfoViewModel.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 19.03.24.
//

import Foundation

final class FavouriteTicketInfoViewModel {

    var ticketInfo: TicketInfo?
    
    var databaseService: DatabaseServiceProtocol
    
        init(databaseService: DatabaseServiceProtocol) {
            self.databaseService = databaseService
        }
        
    func configureTicketInfo(with ticketInfo: TicketInfo) {
        self.ticketInfo = ticketInfo
    }
        
    func deleteTicket() {
        guard let ticketInfo = ticketInfo else { return }
        databaseService.deleteFavouriteTicket(ticket: ticketInfo)
    }
}
