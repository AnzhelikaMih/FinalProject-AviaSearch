//
//  FavouriteTicketListViewModel.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 14.03.24.
//

import Foundation

final class FavouriteTicketListViewModel {
    
    var ticketList: [TicketInfo] = [] {
        didSet {
            favouriteTicketListUpdated?()
        }
    }
    
    var favouriteTicketListUpdated: (() -> ())?
    
    var databaseService: DatabaseServiceProtocol
    
        init(databaseService: DatabaseServiceProtocol) {
            self.databaseService = databaseService
        }
    
    func fetchData() {
        ticketList = databaseService.fetchFavouriteTickets()
    }
}
