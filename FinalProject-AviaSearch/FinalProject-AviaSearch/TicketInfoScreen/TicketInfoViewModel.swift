//
//  TicketInfoViewModel.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 14.03.24.
//

import Foundation

final class TicketInfoViewModel {
    
    var ticketInfo: TicketInfo
    var selectedDate: Date
    var displayModel: TicketInfoDisplayModel
    
    init(ticketInfo: TicketInfo, selectedDate: Date) {
        
       self.ticketInfo = ticketInfo
       self.selectedDate = selectedDate
       self.displayModel = TicketInfoDisplayModel(
                departureCode: ticketInfo.departureCode,
                departure: ticketInfo.departure,
                journeyTime: ticketInfo.journeyTime,
                destinationCode: ticketInfo.destinationCode,
                destination: ticketInfo.destination,
                flightNumber: ticketInfo.flightNumber,
                terminal: ticketInfo.terminal,
                airplane: ticketInfo.airplane,
                departureTime: ticketInfo.departureTime,
                seatNumber: ticketInfo.seatNumber,
                passenger: ticketInfo.passenger,
                passport: ticketInfo.passportNumber,
                ticketNum: ticketInfo.eTicketNumber,
                aviaOperator: ticketInfo.aviaOperator,
                payment: ticketInfo.payment,
                price: ticketInfo.price,
                date: String.formatDate(with: selectedDate)
            )
        }
    
    func saveTicketToFavourite() {
        
        let myTicket = TicketInfo(departure: displayModel.departure, departureCode: displayModel.departureCode, destination: displayModel.destination, destinationCode: displayModel.destinationCode, aviaOperator: displayModel.aviaOperator, flightNumber: displayModel.flightNumber, terminal: displayModel.terminal, airplane: displayModel.airplane, date: displayModel.date ?? "", departureTime: displayModel.departureTime, arrivalTime: "", journeyTime: displayModel.journeyTime, seatNumber: displayModel.seatNumber, passenger: displayModel.passenger, passportNumber: displayModel.passport, eTicketNumber: displayModel.ticketNum, payment: displayModel.payment, price: displayModel.price)
        
        CoreDataService.shared.saveTicketToFavourite(with: myTicket)
    }
}
