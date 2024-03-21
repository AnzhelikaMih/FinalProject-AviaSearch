//
//  TicketListViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 26.02.24.
//

import UIKit

final class TicketListViewController: UIViewController {
    
    private var viewModel = TicketListViewModel()
    
    private var datePicker: UIDatePicker!
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var heartButton: UIButton!
    @IBOutlet private weak var textFieldDate: UITextField!
    @IBOutlet private weak var checkMarkButton: UIButton!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBackBarButton()
        setupLocalization()
        setupTableView()
        setupCurrentDate()
        setupViewModel()
        bind()
        setupDatePicker()
        setupSegmentedControl()
    }
    
    private func setupLocalization() {
        titleLabel.text = Localization.titleLabelAllFlights.localized
        textFieldDate.placeholder = Localization.selectDate.localized
        segmentedControl.setTitle(Localization.segment1.localized, forSegmentAt: 1)
    }
    
    private func setupTableView() {
        tableView.register(TicketListTableViewCell.self)
    }
    
    private func setupCurrentDate() {
        viewModel.setupCurrentDate()
    }
    
    private func setupViewModel() {
        viewModel.loadTicketList() 
    }
    
    private func bind() {
        viewModel.ticketListUpdated = { self.tableView.reloadData() }
    }
    
    private func setupDatePicker() {
        datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
        datePicker.minimumDate = Date()
        datePicker.addTarget(self,
                             action: #selector(dateDidChanged(_:)),
                             for: .valueChanged)
        textFieldDate.inputView = datePicker
    }
    
    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = SegmentedControlCases.allFlights.rawValue
    }

    @objc private func dateDidChanged(_ sender: UIDatePicker) {
        viewModel.selectedDate = sender.date
        textFieldDate.text = String.formatDate(with: sender.date)
    }
    
    private func navigateToFavouriteTicketList() {
        let storyboard = UIStoryboard(name: Screens.FavouriteTicketList.rawValue,
                                      bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: FavouriteTicketListViewController.identifier) as? FavouriteTicketListViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func navigateToMapEarth() {
        let storyboard = UIStoryboard(name: Screens.Map.rawValue,
                                      bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: MapViewController.identifier) as? MapViewController
        else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func updateTableView(with tickets: [TicketInfo]) {
        viewModel.ticketList = tickets
        tableView.reloadData()
    }
    
    @IBAction private func heartButtonDidTap () {
        navigateToFavouriteTicketList()
    }
    
    @IBAction private func mapButtonDidTap () {
        navigateToMapEarth()
    }
    
    @IBAction private func checkMarkButtonDidTap() {
            textFieldDate.resignFirstResponder()
        
        if let selectedDate = self.viewModel.selectedDate {
            for cell in tableView.visibleCells {
                guard let cell = cell as? TicketListTableViewCell else {
                    continue
                }
                cell.setDataLabel(with: selectedDate)
            }
        }
    }
    
    @IBAction private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        guard let type = SegmentedControlCases(rawValue: sender.selectedSegmentIndex) else { return }
        
        switch type {
            case .flightsFromMinsk:
                let filteredTickets = viewModel.filterTicketsByDepartureCode(with: sampleTicketData.departureCode)
                updateTableView(with: filteredTickets)
            
            case .allFlights:
                setupViewModel()
            
            case .flightsToMinsk:
                let filteredTickets = viewModel.filterTicketsByDestinationCode(with: sampleTicketData.departureCode)
                updateTableView(with: filteredTickets)
        }
    }
}

extension TicketListViewController: UITableViewDataSource {
    
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
        if let selectedDate = self.viewModel.selectedDate {
            cell.setDataLabel(with: selectedDate)
        }
        return cell
    }
}

extension TicketListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, 
                   didSelectRowAt indexPath: IndexPath) {
        
        let ticketInfo = viewModel.ticketList[indexPath.row]
        let selectedDate = self.viewModel.selectedDate ?? Date()
        
        let storyboard = UIStoryboard(name: Screens.TicketInfo.rawValue,
                                      bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: TicketInfoViewController.identifier) as? TicketInfoViewController {
            
            let ticketInfoViewModel = TicketInfoViewModel(ticketInfo: ticketInfo, selectedDate: selectedDate)
            vc.viewModel = ticketInfoViewModel
            present(vc, animated: true)
        }
    }
}


