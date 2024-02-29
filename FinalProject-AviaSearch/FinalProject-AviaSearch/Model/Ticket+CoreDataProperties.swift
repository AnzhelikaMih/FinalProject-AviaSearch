//
//  Ticket+CoreDataProperties.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 29.02.24.
//
//

import Foundation
import CoreData


extension Ticket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ticket> {
        return NSFetchRequest<Ticket>(entityName: "Ticket")
    }

    @NSManaged public var departure: String?
    @NSManaged public var departureCode: String?
    @NSManaged public var destination: String?
    @NSManaged public var destinationCode: String?
    @NSManaged public var aviaOperator: String?
    @NSManaged public var flightNumber: String?
    @NSManaged public var terminal: String?
    @NSManaged public var airplane: String?
    @NSManaged public var date: String?
    @NSManaged public var departureTime: String?
    @NSManaged public var arrivalTime: String?
    @NSManaged public var attribute: String?
    @NSManaged public var seatNumber: String?
    @NSManaged public var passenger: String?
    @NSManaged public var passportNumber: String?
    @NSManaged public var eTicketNumber: String?
    @NSManaged public var payment: String?
    @NSManaged public var journeyTime: String?
    @NSManaged public var price: String?

}

extension Ticket : Identifiable {

}
