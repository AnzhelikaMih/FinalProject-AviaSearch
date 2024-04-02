//
//  MainViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 22.02.24.
//

import UIKit

final class MainViewController: UIViewController, Storyboardable {
    
    weak var coordinator: AppCoordinator?
    
    @IBOutlet private weak var mainLabel: UILabel!
    @IBOutlet private weak var subLabel: UILabel!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var airplane: UIImageView!
    @IBOutlet private weak var blueView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalization()
        self.setupBackBarButton()
        prepareInitialAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resetAirplanePosition()
    }
    
    private func setupLocalization() {
        mainLabel.text = Localization.mainLabel.localized
        subLabel.text = Localization.subLabel.localized
        startButton.setLocalizedTitle(with: Localization.startButton.localized)
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
        coordinator?.navigateToTicketList()
    }
    
    @IBAction private func startButtonDidTap () {
        self.rotateAirplane(self.airplane) {
            self.translateAirplane(self.airplane) {
                    self.navigateToTicketList()
            }
        }
    }
}




