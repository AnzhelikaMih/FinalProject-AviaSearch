//
//  TabBarViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 5.03.24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ticketListVC = TicketListViewController()
        let favouriteTicketListVC = FavouriteTicketListViewController()
        let mainVC = MainViewController()
        
        ticketListVC.tabBarItem = UITabBarItem(title: "Tickets", image: UIImage(named: "tickets_icon"), tag: 0)
        favouriteTicketListVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorites_icon"), tag: 1)
        mainVC.tabBarItem = UITabBarItem(title: "Main", image: UIImage(named: "main_icon"), tag: 2)
        
        viewControllers = [ticketListVC, favouriteTicketListVC, mainVC]
    }
    
}
