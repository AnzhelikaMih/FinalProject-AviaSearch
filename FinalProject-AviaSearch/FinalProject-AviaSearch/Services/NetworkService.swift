//
//  NetworkService.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 22.02.24.
//

import Foundation

protocol NetworkServiceProtocol {
    func loadFlights(completion: @escaping ([TicketInfo]) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func loadFlights(completion: @escaping ([TicketInfo]) -> Void) {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/AnzhelikaMih/API-flights/main/TicketList.json")
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else
            
            if let jsonData = data {
                let ticketListData = try? JSONDecoder().decode(TicketList.self, from: jsonData)
                DispatchQueue.main.async {
                    completion(ticketListData?.data ?? [])
                }
            }
        }.resume()
    }
}
    
    

    
    
    
