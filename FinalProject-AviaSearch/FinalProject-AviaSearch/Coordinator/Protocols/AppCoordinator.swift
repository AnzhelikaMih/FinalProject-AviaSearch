//
//  AppCoordinator.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 28.03.24.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController.createObject()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateToTicketList() {
      let vc = TicketListViewController.createObject()
      vc.coordinator = self
      navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToFavouriteTicketList() {
        let vc = FavouriteTicketListViewController.createObject()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
   func navigateToMapEarth() {
       let vc = MapViewController.createObject()
       vc.coordinator = self
       navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToTicketInfo(ticketInfo: TicketInfo, selectedDate: Date) {
        let vc = TicketInfoViewController.createObject()
        let ticketInfoViewModel = TicketInfoViewModel(ticketInfo: ticketInfo, selectedDate: selectedDate)
        vc.coordinator = self
        vc.viewModel = ticketInfoViewModel
        navigationController.present(vc, animated: true, completion: nil)
    }
}
