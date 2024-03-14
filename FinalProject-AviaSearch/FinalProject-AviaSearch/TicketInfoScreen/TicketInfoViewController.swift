//
//  TicketInfoViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 27.02.24.
//

import UIKit

final class TicketInfoViewController: UIViewController {
    
    var viewModel:TicketInfoViewModel!
    
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
    
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var cancelButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        let displayModel = viewModel.displayModel
        
        departureCode.text = displayModel.departureCode
        departure.text = displayModel.departure
        journeyTime.text = displayModel.journeyTime
        destinationCode.text = displayModel.destinationCode
        destination.text = displayModel.destination
        flightNumber.text = displayModel.flightNumber
        terminal.text = displayModel.terminal
        airplane.text = displayModel.airplane
        departureTime.text = displayModel.departureTime
        seatNumber.text = displayModel.seatNumber
        passenger.text = displayModel.passenger
        passport.text = displayModel.passport
        ticketNum.text = displayModel.ticketNum
        aviaOperator.text = displayModel.aviaOperator
        payment.text = displayModel.payment
        price.text = displayModel.price
        date.text = displayModel.date
    }
     
    @IBAction private func saveButtonDidTap(_ sender: Any) {
        viewModel.saveTicketToFavourite()
        
        let alert = UIAlertController(title: Alerts.TicketIsSaved.title.rawValue,
                                      message: Alerts.TicketIsSaved.message.rawValue,
                                      preferredStyle: .alert)
        present(alert, animated: true)
        closeWithAnimation()
        dismiss(animated: true)
    }
    
    private func closeWithAnimation() {
        UIView.animate(withDuration: 1, animations: {
                self.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            }) { ( finished ) in
                self.dismiss(animated: false, completion: nil)
            }
    }
    
    @IBAction private func cancelButtonDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
}
