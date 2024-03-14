//
//  FavouriteTicketListViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 5.03.24.
//

import UIKit

final class FavouriteTicketListViewController: UIViewController {
    
    private var viewModel = FavouriteTicketListViewModel()
    
    @IBOutlet private weak var favouriteTicketsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: String(describing: TicketListTableViewCell.self),
                        bundle: nil)
        favouriteTicketsTableView.register(nib, forCellReuseIdentifier: String(describing: TicketListTableViewCell.self))
    }
    
    private func setupViewModel() {
        viewModel.favouriteTicketListUpdated = { self.favouriteTicketsTableView.reloadData() }
        viewModel.fetchData()
    }
}

extension FavouriteTicketListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, 
                   numberOfRowsInSection section: Int) -> Int {
        return viewModel.ticketList.count
    }
    
    func tableView(_ tableView: UITableView, 
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TicketListTableViewCell.self), for: indexPath) as! TicketListTableViewCell
        let ticketInfo = viewModel.ticketList[indexPath.row]
        cell.configure(with: ticketInfo)
        return cell
    }
}

extension FavouriteTicketListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, 
                   didSelectRowAt indexPath: IndexPath) {
        
        let ticketInfo = viewModel.ticketList[indexPath.row]
        let storyboard = UIStoryboard(name: Screens.FavouriteTicketInfo.rawValue,
                                      bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: String(describing: FavouriteTicketInfoViewController.self)) as? FavouriteTicketInfoViewController {
            present(vc, animated: true)
            vc.delegate = self // не удалять а то не обновляется при удалении список любимых билетов
            vc.configureTicketInfo(with: ticketInfo)
        }
    }
}

extension FavouriteTicketListViewController: FavouriteTicketInfoDelegate {
    func didDeleteTicket() {
            viewModel.fetchData()
        favouriteTicketsTableView.reloadData()
                
            }
        
}
