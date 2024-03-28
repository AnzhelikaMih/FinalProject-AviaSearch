//
//  FavouriteTicketInfoViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 5.03.24.
//

import UIKit

protocol FavouriteTicketInfoDelegate: AnyObject {
    func didDeleteTicket ()
}

final class FavouriteTicketInfoViewController: UIViewController, Storyboardable {
    
    weak var coordinator: AppCoordinator?
    
    private var viewModel = FavouriteTicketInfoViewModel()
    
    weak var delegate: FavouriteTicketInfoDelegate?
    
    @IBOutlet private weak var titleLabel: UILabel!
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
    
    @IBOutlet private weak var deleteButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalization()
    }
    
    private func setupLocalization() {
        titleLabel.text = Localization.myTicketInfo.localized
        deleteButton.setTitle(Localization.deleteTicketButton.localized, for: .normal)
        cancelButton.setTitle(Localization.cancelButton.localized, for: .normal)
    }
    
    func configureTicketInfo(with ticketInfo: TicketInfo) {
        viewModel.configureTicketInfo(with: ticketInfo)
        
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
    
    @IBAction private func deleteButtonDidTap(_ sender: Any) {
        viewModel.deleteTicket()
        delegate?.didDeleteTicket()
        
        let alert = UIAlertController(title: Localization.alertTitleDeleted.localized,
                                      message: Localization.alertMessageDeleted.localized,
                                      preferredStyle: .alert)
        present(alert, animated: true)
        self.deleteTicketWithAnimation()
        dismiss(animated: true)
    }

    @IBAction private func cancelButtonDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
}

