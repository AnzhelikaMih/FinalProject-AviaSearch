//
//  TicketListView.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import UIKit

final class TicketListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private var ticketList = [TicketInfo]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchTicketList()
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: "TicketListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TicketListTableViewCell")
    }
    
    private func fetchTicketList() {
        let fetcher = TicketListFetcher()
        
        fetcher.fetch { [weak self] (data) in
            self?.ticketList = data
            
        }
    }
}

extension TicketListViewController: UITableViewDataSource {
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

extension TicketListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ticketInfo = ticketList[indexPath.row]
        let storyboard = UIStoryboard(name: "TicketInfo", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TicketInfoViewController") as? TicketInfoViewController {
            
           vc.loadView()
           vc.configureTicketInfo(with: ticketInfo)
           navigationController?.pushViewController(vc, animated: true)
        }
    }
}


