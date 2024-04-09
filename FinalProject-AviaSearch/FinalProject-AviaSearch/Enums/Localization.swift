//
//  Alerts.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 14.03.24.
//

import Foundation

enum Localization: String {
    
    case mainLabel = "mail_Label"
    case subLabel = "sub_label"
    case startButton = "start_button"
    case backButton = "back_button"
    case titleLabelAllFlights = "nearest_flights_label"
    case selectDate = "select_date"
    case segment1 = "segment1";
    case ticketInfo = "ticket_info"
    case saveTicketButton = "save_ticket_button"
    case cancelButton = "cancel_button"
    case myTickets = "my_tickets"
    case myTicketInfo = "my_ticket"
    case deleteTicketButton = "delete_ticket_button"
    case alertTitleGeolocation = "alert_title_geolocation"
    case alertMessageGeolocation = "alert_message_geolocation"
    case settings = "settings"
    case alertTitleSaved = "alert_title_saved"
    case alertMessageSaved = "alert_message_saved"
    case alertTitleDeleted = "alert_title_deleted"
    case alertMessageDeleted = "alert_message_deleted"
    
    case urlLocationService = "App-Prefs:root=LOCATION_SERVICES"
    
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
