//
//  UIButton+.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 2.04.24.
//

import UIKit

extension UIButton {
    
    func setLocalizedTitle(with title: String) {
        let font = UIFont(name: "HelveticaNeue-Light", size: 23.0)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font as Any
        ]
        let attributedText = NSAttributedString(string: title, attributes: attributes)
        self.setAttributedTitle(attributedText, for: .normal)
    }
}
