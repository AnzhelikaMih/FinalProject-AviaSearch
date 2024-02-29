//
//  TicketInfo.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import Foundation
import UIKit

struct TicketInfo: Decodable {
    let departure: String
    let departureCode: String
    let destination: String
    let destinationCode: String
    let aviaOperator: String
    let flightNumber: String
    let terminal: String
    let airplane: String
    let date: String
    let departureTime: String
    let arrivalTime: String
    let journeyTime: String
    let seatNumber: String
    let passenger: String
    let passportNumber: String
    let eTicketNumber: String
    let payment: String
    let price: String

    enum CodingKeys: String, CodingKey {
        case departure
        case departureCode = "departure_code"
        case destination
        case destinationCode = "destination_code"
        case aviaOperator = "avia_operator"
        case flightNumber = "flight_number"
        case terminal
        case airplane = "airplane"
        case date
        case departureTime = "departure_time"
        case arrivalTime = "arrival_time"
        case journeyTime = "journey_time"
        case seatNumber = "seat_number"
        case passenger
        case passportNumber = "passport_number"
        case eTicketNumber = "e_ticket_number"
        case payment
        case price
    }
}

let sampleTicketData: [TicketInfo] = [
    TicketInfo(departure: "MINSK", departureCode: "MSK",
               destination: "DUBAI", destinationCode: "DXB",
               aviaOperator: "Belavia", flightNumber: "B2 717",
               terminal: "А", airplane: "Boeing 737-8",
               date: "Люты 26",departureTime: "08:45", arrivalTime: "13:20",
               journeyTime: "4г 35хв", seatNumber: "29A",
               passenger: "Анжалiка Мiхальчэня", passportNumber: "МР0123456",
               eTicketNumber: "0120 345 6789", 
               payment: "VISA *** **77", price: "$1099.99")
]
