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
        
    @IBAction private func cancelButtonDidTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
    }
        
    
    

}
