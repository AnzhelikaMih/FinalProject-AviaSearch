//
//  FavouriteTicketListViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 5.03.24.
//

import UIKit

final class FavouriteTicketListViewController: UIViewController {
    
    @IBOutlet private weak var tableViewFavourite: UITableView!

    private var ticketList = [TicketInfo]() {
        didSet {
            tableViewFavourite.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchData()
    }
    
    
    private func setupTableView() {
        let nib = UINib(nibName: "TicketListTableViewCell", bundle: nil)
        tableViewFavourite.register(nib, forCellReuseIdentifier: "TicketListTableViewCell")
    }
    
    private func fetchData() {
        ticketList = CoreDataService.shared.fetchFavouriteTickets()
            
        }
    }

extension FavouriteTicketListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ticketList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketListTableViewCell", for: indexPath) as! TicketListTableViewCell
        let ticketInfo = ticketList[indexPath.row]
        cell.configure(with: ticketInfo)
        return cell
    }

}

extension FavouriteTicketListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ticketInfo = ticketList[indexPath.row]
        let storyboard = UIStoryboard(name: "FavouriteTicketInfo", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "FavouriteTicketInfoViewController") as? FavouriteTicketInfoViewController {
            
           vc.loadView()
           vc.configureTicketInfo(with: ticketInfo)
           navigationController?.pushViewController(vc, animated: true)
        }
    }
}
