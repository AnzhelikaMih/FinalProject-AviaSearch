//
//  CoreDataService.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 29.02.24.
//

import CoreData

final class CoreDataService {

    static let shared = CoreDataService()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Models")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveTicketToFavourite(with ticket: TicketInfo) {
        let favTicket = Ticket(context: self.context)
        favTicket.airplane = ticket.airplane
        favTicket.arrivalTime = ticket.arrivalTime
        favTicket.aviaOperator = ticket.aviaOperator
        favTicket.date = ticket.date
        favTicket.departure = ticket.departure
        favTicket.departureCode = ticket.departureCode
        favTicket.departureTime = ticket.departureTime
        favTicket.destination = ticket.destination
        favTicket.destinationCode = ticket.departureCode
        favTicket.eTicketNumber = ticket.eTicketNumber
        favTicket.flightNumber = ticket.flightNumber
        favTicket.passenger = ticket.passenger
        favTicket.passportNumber = ticket.passportNumber
        favTicket.payment = ticket.payment
        favTicket.price = ticket.price
        favTicket.seatNumber = ticket.seatNumber
        favTicket.terminal = ticket.terminal

        saveContext()
    }
    
    func fetchFavouriteTickets() -> [TicketInfo] {
        let request = Ticket.fetchRequest()
        guard let favTickets = try? context.fetch(request) else { return [] }
        let ticketViewModels = favTickets.compactMap { return TicketInfo(departure: $0.departure ?? "nil", departureCode: $0.departureCode ?? "nil", destination: $0.destination ?? "nil", destinationCode: $0.destinationCode ?? "nil", aviaOperator: $0.aviaOperator ?? "nil", flightNumber: $0.flightNumber ?? "nil", terminal: $0.terminal ?? "nil", airplane: $0.airplane ?? "nil", date: $0.date ?? "nil", departureTime: $0.departureTime ?? "nil", arrivalTime: $0.arrivalTime ?? "nil", journeyTime: $0.journeyTime ?? "nil", seatNumber: $0.seatNumber ?? "nil", passenger: $0.passenger ?? "nil", passportNumber: $0.passportNumber ?? "nil", eTicketNumber: $0.eTicketNumber ?? "nil", payment: $0.payment ?? "nil", price: $0.price ?? "nil") }
        return ticketViewModels
    }
    
    private func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
