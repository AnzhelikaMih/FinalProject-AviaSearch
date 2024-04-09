//
//  Storyboardable.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 28.03.24.
//

import UIKit

protocol Storyboardable {
    static func createObject() -> Self
}

extension Storyboardable where Self: UIViewController {
    static func createObject() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: id, bundle: nil)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
