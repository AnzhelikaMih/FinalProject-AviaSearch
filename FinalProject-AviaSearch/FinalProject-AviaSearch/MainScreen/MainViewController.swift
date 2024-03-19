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
        self.setupBackBarButton()
        prepareInitialAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resetAirplanePosition()
    }
    
    private func prepareInitialAnimation() {
        blueView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueView.topAnchor.constraint(equalTo: view.topAnchor),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.layoutIfNeeded()
        self.animateBlueViewHeight(blueView, to: 0.5)
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
        let storyboard = UIStoryboard(name: Screens.TicketList.rawValue,
                                      bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: String(describing: TicketListViewController.self)) as? TicketListViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func startButtonDidTap () {
        self.rotateAirplane(self.airplane) {
            self.translateAirplane(self.airplane) {
                    self.navigateToTicketList()
            }
        }
    }
}




