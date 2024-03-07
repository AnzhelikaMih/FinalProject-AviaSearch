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

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        airplane.transform = .identity
        airplane.frame = CGRect(x: 50, y: 50, width: 293, height: 326)
        
    }
    
    @IBAction private func startButtonDidTap () {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.airplane.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6.3)
               }) { (finished) in
                   if finished {
                       UIView.animate(withDuration: 1.0, animations: {
                           self.airplane.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
                       }) { (finished) in
                           if finished {
                               let storyboard = UIStoryboard(name: "TicketList", bundle: nil)
                               guard let vc = storyboard.instantiateViewController(identifier: "TicketListViewController") as? TicketListViewController else { return }
                               
                               self.navigationController?.pushViewController(vc, animated: true)
                           }
                       }
                   }
               }
           }
    }




