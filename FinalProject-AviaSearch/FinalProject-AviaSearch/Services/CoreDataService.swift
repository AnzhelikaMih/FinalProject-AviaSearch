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
        let container = NSPersistentContainer(name: "CoreDataModel")
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
        
        let myTicket = Ticket(context: self.context)
        myTicket.airplane = ticket.airplane
        myTicket.arrivalTime = ticket.arrivalTime
        myTicket.aviaOperator = ticket.aviaOperator
        myTicket.date = ticket.date
        myTicket.departure = ticket.departure
        myTicket.departureCode = ticket.departureCode
        myTicket.departureTime = ticket.departureTime
        myTicket.destination = ticket.destination
        myTicket.destinationCode = ticket.destinationCode
        myTicket.eTicketNumber = ticket.eTicketNumber
        myTicket.flightNumber = ticket.flightNumber
        myTicket.passenger = ticket.passenger
        myTicket.passportNumber = ticket.passportNumber
        myTicket.payment = ticket.payment
        myTicket.price = ticket.price
        myTicket.seatNumber = ticket.seatNumber
        myTicket.terminal = ticket.terminal
        myTicket.journeyTime = ticket.journeyTime

        saveContext()
    }
    
    func fetchFavouriteTickets() -> [TicketInfo] {
        let request = Ticket.fetchRequest()
        guard let myTickets = try? context.fetch(request) else { return [] }
        let ticketViewModels = myTickets.compactMap 
            { return TicketInfo(departure: $0.departure,
                                departureCode: $0.departureCode,
                                destination: $0.destination,
                                destinationCode: $0.destinationCode,
                                aviaOperator: $0.aviaOperator,
                                flightNumber: $0.flightNumber,
                                terminal: $0.terminal,
                                airplane: $0.airplane,
                                date: $0.date,
                                departureTime: $0.departureTime,
                                arrivalTime: $0.arrivalTime,
                                journeyTime: $0.journeyTime,
                                seatNumber: $0.seatNumber,
                                passenger: $0.passenger,
                                passportNumber: $0.passportNumber,
                                eTicketNumber: $0.eTicketNumber,
                                payment: $0.payment,
                                price: $0.price) }
            return ticketViewModels
    }
    
    func deleteFavouriteTicket(ticket: TicketInfo) {
        let request = NSFetchRequest<Ticket>(entityName: "Ticket")
        request.predicate = NSPredicate(format: "flightNumber == %@", ticket.flightNumber)

        do {
            let matchingTickets = try context.fetch(request)

            if let ticketToDelete = matchingTickets.first {
                context.delete(ticketToDelete)
                saveContext()
            }
        } catch {
            print("Unresolved error \(error.localizedDescription)")
        }
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
