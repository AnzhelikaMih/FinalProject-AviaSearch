//
//  TicketListViewModel.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 12.03.24.
//

import Foundation

final class TicketListViewModel {
    
    var ticketList: [TicketInfo] = []

    var selectedDate: Date?
    
    func setupCurrentDate() {
        selectedDate = Date()
    }

    func loadTicketList(completion: @escaping () -> Void) {
        
        let fetcher = NetworkService()
        fetcher.loadFlights { [weak self] data in
            self?.ticketList = data
            completion()
        }
    }
    
    func filterTicketsByDepartureCode(with code: String) -> [TicketInfo] {
            return ticketList.filter { $0.departureCode == code }
    }
        
    func filterTicketsByDestinationCode(with code: String) -> [TicketInfo] {
            return ticketList.filter { $0.destinationCode == code }
    }
    
}

