//
//  TicketListView.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import UIKit

final class TicketListViewController: UIViewController {
    
    private var datePicker: UIDatePicker!
    
    private var ticketList = [TicketInfo]() {
        didSet {
            tableView.reloadData()
        }
    }
    private var selectedDate: Date?
    private var dateString: String?
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var heartButton: UIButton!
    @IBOutlet private weak var textFieldDate: UITextField!
    @IBOutlet private weak var checkMarkButton: UIButton!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        datePicker = generateDatePicker(with: .date)
        textFieldDate.inputView = datePicker
        fetchTicketList()
    }
    
    private func generateDatePicker(with mode: UIDatePicker.Mode) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = mode
        datePicker.preferredDatePickerStyle = .inline
        datePicker.addTarget(self, action: #selector(dateDidChanged(_:)), for: .valueChanged)
        return datePicker
    }
    
    @objc private func dateDidChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        textFieldDate.text = dateFormatter.string(from: selectedDate)
        self.selectedDate = selectedDate
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
    
    @IBAction private func heartButtonDidTap () {
        
        let storyboard = UIStoryboard(name: "FavouriteTicketList", bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: "FavouriteTicketListViewController") as? FavouriteTicketListViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func checkMarkButtonDidTap() {
            textFieldDate.resignFirstResponder()
        if let selectedDate = self.selectedDate {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd.MM.yyyy"
                    let dateString = dateFormatter.string(from: selectedDate)
                    for cell in tableView.visibleCells {
                        if let ticketCell = cell as? TicketListTableViewCell {
                            ticketCell.setDataLabel(dateString)
                        }
                    }
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
        cell.setDate()
        return cell
    }
}

extension TicketListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ticketInfo = ticketList[indexPath.row]
        let storyboard = UIStoryboard(name: "TicketInfo", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "TicketInfoViewController") as? TicketInfoViewController {
            
           vc.loadView()

            if let selectedDate = self.selectedDate {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd.MM.yyyy"
                let dateString = dateFormatter.string(from: selectedDate)
                vc.selectedDate = dateString }
            vc.configureTicketInfo(with: ticketInfo)
           present(vc, animated: true)
        }
    }
}


