//
//  AlertService.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 14.03.24.
//

import Foundation

enum Alerts {
    
    enum geolocationTurnedOff: String {
        case title = "У вас выключана служба геалакацii"
        case message = "Хочаце ўключыць?"
        case url = "App-Prefs:root=LOCATION_SERVICES"
    }
    
    enum Action: String {
        case settings = "Наладкі"
        case cancel = "Вярнуцца"
    }
    
    enum TicketIsSaved: String {
        case title = "♡"
        case message = "Ваш квiток захаван"
    }
    
    enum TicketIsDeleted: String {
        case title = "✕"
        case message = "Ваш квiток выдален"
    }
    
}
