//
//  MainViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 22.02.24.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var airplane: UIImageView!
    @IBOutlet private weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resetAirplanePosition()
    }
    
    private func resetAirplanePosition() {
        airplane.transform = .identity
        airplane.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            airplane.centerXAnchor.constraint(equalTo: blueView.centerXAnchor),
            airplane.centerYAnchor.constraint(equalTo: blueView.centerYAnchor),
            airplane.widthAnchor.constraint(equalToConstant: 300),
            airplane.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func navigateToTicketList() {
        let storyboard = UIStoryboard(name: "TicketList",
                                      bundle: nil)
        guard let ticketListViewController = storyboard.instantiateViewController(identifier: "TicketListViewController") as? TicketListViewController else { return }
        navigationController?.pushViewController(ticketListViewController, animated: true)
    }
    
    @IBAction private func startButtonDidTap () {
        UIView.animate(withDuration: 1.0,
                           animations: {
                self.airplane.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6.3)
                }) { _ in
                    UIView.animate(withDuration: 1.0, 
                                   animations: {
                        self.airplane.transform = CGAffineTransform(translationX: self.view.bounds.width, 
                                                                    y: 0)
                    }) { _ in
                        self.navigateToTicketList()
                    }
                }
    }
}




