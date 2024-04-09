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
    
    private var networkService: NetworkServiceProtocol
    
        init(networkService: NetworkServiceProtocol) {
            self.networkService = networkService
        }
    
    func setupCurrentDate() {
        selectedDate = Date()
    }

    func loadTicketList() {
        networkService.loadFlights { [weak self] data in
            guard let self = self else { return }
            self.ticketList = data
        }
    }
    
    func filterTicketsByDepartureCode(with code: String) -> [TicketInfo] {
        return ticketList.filter { $0.departureCode == code }
    }
        
    func filterTicketsByDestinationCode(with code: String) -> [TicketInfo] {
        return ticketList.filter { $0.destinationCode == code }
    }
}

