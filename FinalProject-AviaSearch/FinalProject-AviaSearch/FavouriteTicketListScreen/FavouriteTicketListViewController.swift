//
//  FavouriteTicketListViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 5.03.24.
//

import UIKit

final class FavouriteTicketListViewController: UIViewController, Storyboardable {
    
    weak var coordinator: AppCoordinator?
    
    var viewModel: FavouriteTicketListViewModel!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViewModel()
        bind()
        setupLocalization()
    }
    
    private func setupTableView() {
        tableView.register(TicketListTableViewCell.self)
    }
    
    private func setupViewModel() {
        viewModel.fetchData()
    }
    
    private func bind() {
        viewModel.favouriteTicketListUpdated = { self.tableView.reloadData() }
    }
    
    private func setupLocalization() {
        titleLabel.text = Localization.myTickets.localized
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
        
        let cell: TicketListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let ticketInfo = viewModel.ticketList[indexPath.row]
        cell.configure(with: ticketInfo)
        return cell
    }
}

extension FavouriteTicketListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, 
                   didSelectRowAt indexPath: IndexPath) {
        
        let ticketInfo = viewModel.ticketList[indexPath.row]
        coordinator?.navigateToFavouriteTicketInfo(ticketInfo: ticketInfo, 
                                                   delegate: self)
    }
}

extension FavouriteTicketListViewController: FavouriteTicketInfoDelegate {
    func didDeleteTicket() {
        setupViewModel()
    }
}
