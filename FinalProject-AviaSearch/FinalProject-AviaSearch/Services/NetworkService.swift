//
//  NetworkService.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 22.02.24.
//

import Foundation

final class NetworkService {
    
    func searchLiveFlights () {
        
        let accessKey = "9109f0a750addb2fff858d7bb78c2091"
        let url = URL(string: "https://api.aviationstack.com/v1/flights?access_key=\(accessKey)")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let results = json["results"] as? [[String: Any]] {
                    
                    for flight in results {
                        
                        if let live = flight["live"] as? [String: Any],
                           let isGround = live["is_ground"] as? Bool, !isGround,
                           let airline = flight["airline"] as? [String: Any],
                           let airlineName = airline["name"] as? String,
                           let flightDetails = flight["flight"] as? [String: Any],
                           let iata = flightDetails["iata"] as? String,
                           let departure = flight["departure"] as? [String: Any],
                           let departureAirport = departure["airport"] as? String,
                           let departureIata = departure["iata"] as? String,
                           let arrival = flight["arrival"] as? [String: Any],
                           let arrivalAirport = arrival["airport"] as? String,
                           let arrivalIata = arrival["iata"] as? String {
                            
                           print("\(airlineName) flight \(iata) from \(departureAirport) (\(departureIata)) to \(arrivalAirport) (\(arrivalIata)) is in the air.")
                        }
                    }
                }
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        .resume()
    }
}
