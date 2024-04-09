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
    
    var databaseService: DatabaseServiceProtocol
    
    init(ticketInfo: TicketInfo, selectedDate: Date, databaseService: DatabaseServiceProtocol) {
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
        self.databaseService = databaseService
        }
    
    func saveTicketToFavourite() {
        
        let myTicket = TicketInfo(departure: displayModel.departure, 
                                  departureCode: displayModel.departureCode,
                                  destination: displayModel.destination,
                                  destinationCode: displayModel.destinationCode,
                                  aviaOperator: displayModel.aviaOperator,
                                  flightNumber: displayModel.flightNumber,
                                  terminal: displayModel.terminal,
                                  airplane: displayModel.airplane,
                                  date: displayModel.date ?? "",
                                  departureTime: displayModel.departureTime,
                                  arrivalTime: "", 
                                  journeyTime:displayModel.journeyTime,
                                  seatNumber: displayModel.seatNumber,
                                  passenger: displayModel.passenger,
                                  passportNumber: displayModel.passport,
                                  eTicketNumber: displayModel.ticketNum,
                                  payment: displayModel.payment,
                                  price: displayModel.price)
        
        databaseService.saveTicketToFavourite(with: myTicket)
    }
}
