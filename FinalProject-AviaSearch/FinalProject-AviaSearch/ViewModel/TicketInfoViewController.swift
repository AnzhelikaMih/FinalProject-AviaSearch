//
//  TicketInfoViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 27.02.24.
//

import UIKit

final class TicketInfoViewController: UIViewController {
    
    private var ticketInfo: TicketInfo?
    
    @IBOutlet private weak var departureCode: UILabel!
    @IBOutlet private weak var departure: UILabel!
    @IBOutlet private weak var journeyTime: UILabel!
    @IBOutlet private weak var destinationCode: UILabel!
    @IBOutlet private weak var destination: UILabel!
    
    @IBOutlet private weak var flightNumber: UILabel!
    @IBOutlet private weak var terminal: UILabel!
    @IBOutlet private weak var airplane: UILabel!
    
    @IBOutlet private weak var date: UILabel!
    @IBOutlet private weak var departureTime: UILabel!
    @IBOutlet private weak var seatNumber: UILabel!
    
    @IBOutlet private weak var passenger: UILabel!
    @IBOutlet private weak var passport: UILabel!
    
    @IBOutlet private weak var ticketNum: UILabel!
    @IBOutlet private weak var aviaOperator: UILabel!
    
    @IBOutlet private weak var payment: UILabel!
    @IBOutlet private weak var price: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureTicketInfo(with ticketInfo: TicketInfo) {
        
        departureCode.text = ticketInfo.departureCode
        departure.text = ticketInfo.departure
        journeyTime.text = ticketInfo.journeyTime
        destinationCode.text = ticketInfo.destinationCode
        destination.text = ticketInfo.destination
        flightNumber.text = ticketInfo.flightNumber
        terminal.text = ticketInfo.terminal
        airplane.text = ticketInfo.airplane
        date.text = ticketInfo.date
        departureTime.text = ticketInfo.departureTime
        seatNumber.text = ticketInfo.seatNumber
        passenger.text = ticketInfo.passenger
        passport.text = ticketInfo.passportNumber
        ticketNum.text = ticketInfo.eTicketNumber
        aviaOperator.text = ticketInfo.aviaOperator
        payment.text = ticketInfo.payment
        price.text = ticketInfo.price
    }
     
    
    @IBAction private func saveButtonDidTap(_ sender: Any) {
        
        guard let departure = departure.text,
              let departureCode = departureCode.text,
              let journeyTime = journeyTime.text,
              let destinationCode = destinationCode.text,
              let destination = destination.text,
              let flightNumber = flightNumber.text,
              let terminal = terminal.text,
              let airplane = airplane.text,
              let date = date.text,
              let departureTime = departureTime.text,
              let seatNumber = seatNumber.text,
              let passenger = passenger.text,
              let passport = passport.text,
              let ticketNum = ticketNum.text,
              let aviaOperator = aviaOperator.text,
              let payment = payment.text,
              let price = price.text
        else { return }
        
        let favTicket = TicketInfo(departure: departure, departureCode: departureCode, destination: destination, destinationCode: destinationCode, aviaOperator: aviaOperator, flightNumber: flightNumber, terminal: terminal, airplane: airplane, date: date, departureTime: departureTime, arrivalTime: "", journeyTime: journeyTime, seatNumber: seatNumber, passenger: passenger, passportNumber: passport, eTicketNumber: ticketNum, payment: payment, price: price)
        
        CoreDataService.shared.saveTicketToFavourite(with: favTicket)
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction private func cancelButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
        
    
    

}
