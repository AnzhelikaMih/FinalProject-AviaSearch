//
//  BackBarItem.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 19.03.24.
//

import UIKit

extension UIViewController {

    func setupBackBarButton() {
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        navigationItem.backBarButtonItem = backButton
    }
}
