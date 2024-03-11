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
        let ticketViewModels = myTickets.compactMap { return TicketInfo(departure: $0.departure ?? "nil", departureCode: $0.departureCode ?? "nil", destination: $0.destination ?? "nil", destinationCode: $0.destinationCode ?? "nil", aviaOperator: $0.aviaOperator ?? "nil", flightNumber: $0.flightNumber ?? "nil", terminal: $0.terminal ?? "nil", airplane: $0.airplane ?? "nil", date: $0.date ?? "nil", departureTime: $0.departureTime ?? "nil", arrivalTime: $0.arrivalTime ?? "nil", journeyTime: $0.journeyTime ?? "nil", seatNumber: $0.seatNumber ?? "nil", passenger: $0.passenger ?? "nil", passportNumber: $0.passportNumber ?? "nil", eTicketNumber: $0.eTicketNumber ?? "nil", payment: $0.payment ?? "nil", price: $0.price ?? "nil") }
        return ticketViewModels
    }
    
    func deleteTicket(ticket: TicketInfo) {
        let request = NSFetchRequest<Ticket>(entityName: "Ticket")
        request.predicate = NSPredicate(format: "flightNumber == %@", ticket.flightNumber)

        do {
            let matchingTickets = try context.fetch(request)

            if let ticketToDelete = matchingTickets.first {
                context.delete(ticketToDelete)
                saveContext()
            }
        } catch {
            print("Ошибка при удалении билета: \(error.localizedDescription)")
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
