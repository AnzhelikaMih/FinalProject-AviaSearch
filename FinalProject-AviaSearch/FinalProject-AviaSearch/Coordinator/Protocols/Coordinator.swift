//
//  Coordinator.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 28.03.24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
