//
//  Animations.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 19.03.24.
//

import UIKit

extension UIViewController {

    func animateBlueViewHeight(_ blueView: UIView, to heightMultiplier: CGFloat) {
        UIView.animate(withDuration: 1.0) {
            blueView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: heightMultiplier).isActive = true
            self.view.layoutIfNeeded()
        }
    }
    
    func rotateAirplane(_ airplane: UIImageView, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5) {
            airplane.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6.3)
        } completion: { (finished) in
            completion()
        }
    }

    func translateAirplane(_ airplane: UIImageView, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.5) {
            airplane.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
        } completion: { (finished) in
            completion()
        }
    }
    
    func saveTicketWithAnimation() {
        UIView.animate(withDuration: 0.5, animations: {
                self.view.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            }) { ( finished ) in
                self.dismiss(animated: false, completion: nil)
            }
    }
    
    func deleteTicketWithAnimation() {
        UIView.animate(withDuration: 1, animations: {
            let rotationTransform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
            let translationTransform = CGAffineTransform(translationX: -self.view.frame.size.width*2, y: 0)
            self.view.transform = rotationTransform.concatenating(translationTransform)
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }

}
