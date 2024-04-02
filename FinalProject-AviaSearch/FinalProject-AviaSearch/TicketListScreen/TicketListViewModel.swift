//
//  TicketListViewModel.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 12.03.24.
//

import Foundation

final class TicketListViewModel {
    
    var ticketList: [TicketInfo] = [] {
        didSet {
            ticketListUpdated?()
        }
    }

    var selectedDate: Date?
    
    var ticketListUpdated: (() -> ())?
    
    func setupCurrentDate() {
        selectedDate = Date()
    }

    func loadTicketList() {
        let fetcher = NetworkService()
        fetcher.loadFlights { [weak self] data in
            self?.ticketList = data
        }
    }
    
    func filterTicketsByDepartureCode(with code: String) -> [TicketInfo] {
            return ticketList.filter { $0.departureCode == code }
    }
        
    func filterTicketsByDestinationCode(with code: String) -> [TicketInfo] {
            return ticketList.filter { $0.destinationCode == code }
    }
}

