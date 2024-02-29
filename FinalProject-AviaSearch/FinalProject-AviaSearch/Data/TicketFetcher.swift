//
//  TicketFetcher.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import Foundation

final class TicketListFetcher {

    func fetch(completion: @escaping ([TicketInfo]) -> Void) {

        guard let path = Bundle.main.path(forResource: "TicketList", ofType: "json") else {
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let ticketListData = try JSONDecoder().decode(TicketList.self, from: data)
            DispatchQueue.main.async {
                completion(ticketListData.data)
            }
        } catch {
            print("json convert failed in JSONDecoder.")
        }
    }
}
