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
        
        UIView.animate(withDuration: 1.0) {
            self.blueView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
            self.view.layoutIfNeeded()
        }
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
    
    private func rotateAirplane(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 1.0) {
            self.airplane.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6.3)
        } completion: { (finished) in
            completion()
        }
    }

    private func translateAirplane(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 1.0) {
            self.airplane.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        } completion: { (finished) in
            completion()
        }
    }
    
    @IBAction private func startButtonDidTap () {
        rotateAirplane {
            self.translateAirplane {
                    self.navigateToTicketList()
                }
            }
    }
}




