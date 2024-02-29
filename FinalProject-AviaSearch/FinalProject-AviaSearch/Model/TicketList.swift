//
//  TicketList.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import Foundation

struct TicketList: Decodable {
    let title: String
    let data: [TicketInfo]
}
