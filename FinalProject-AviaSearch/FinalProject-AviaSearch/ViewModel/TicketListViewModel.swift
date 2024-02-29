//
//  TicketListViewModel.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import Foundation

final class TicketListViewModel {
    
    var ticketList: [TicketInfo] = []
    private let fetcher: TicketListFetcher
    
    init() {
        self.fetcher = TicketListFetcher()
    }

    func fetchTicketList() {
        fetcher.fetch { [weak self] (data) in
            self?.ticketList = data
        }
    }
}
