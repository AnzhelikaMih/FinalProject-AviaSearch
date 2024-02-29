//
//  MainViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 22.02.24.
//

import UIKit

final class MainViewController: UIViewController {
    
    @IBOutlet private weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction private func startButtonDidTap () {
        
        let storyboard = UIStoryboard(name: "TicketList", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "TicketListViewController") as? TicketListViewController else { return }

        navigationController?.pushViewController(vc, animated: true)
    }


}

