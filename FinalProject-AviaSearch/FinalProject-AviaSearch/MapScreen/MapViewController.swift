//
//  MapViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 12.03.24.
//

import UIKit
import MapKit

final class MapViewController: UIViewController, Storyboardable {
    
    weak var coordinator: AppCoordinator?
    
    let locationService = LocationService()
    
    @IBOutlet private weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationService.checkLocationPermissions(with: mapView, 
                                                 completion:
                                                    { showAlertLocation(title: Localization.alertTitleGeolocation.localized,
                            message: Localization.alertMessageGeolocation.localized,
                            url: URL(string: UIApplication.openSettingsURLString)) }
    )}
    
    private func showAlertLocation(title: String,
                                   message: String?,
                                   url: URL?) {
        let alert = UIAlertController(title: title, 
                                      message: message,
                                      preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: Localization.settings.localized,
                                           style: .default)
        { (alert) in
            if let url = url {
                UIApplication.shared.open(url, 
                                          options: [:],
                                          completionHandler: nil) }
        }
        let cancelAction = UIAlertAction(title: Localization.cancelButton.localized,
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, 
                         didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last?.coordinate {
            let region = MKCoordinateRegion(center: location,
                                            latitudinalMeters: 5000,
                                            longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        locationService.checkLocationPermissions(with: mapView) {
            showAlertLocation(title: Localization.alertTitleGeolocation.localized,
                              message: Localization.alertMessageGeolocation.localized,
                              url: URL(string: UIApplication.openSettingsURLString))
        }
    }
}
