//
//  MapEarthViewController.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 12.03.24.
//

import UIKit
import MapKit

final class MapEarthViewController: UIViewController {
    
    let locationService = LocationService()
    
    @IBOutlet private weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupManager()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationPermissions()
    }
    
    private func setupManager() {
        locationService.locationManager.delegate = self
        locationService.locationManager.desiredAccuracy = kCLLocationAccuracyBest
   }
    
    private func checkLocationPermissions() {
        switch locationService.locationManager.authorizationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                setupManager()
                locationService.checkAuthorization(with: mapView)
            case .denied:
                showAlertLocation(title: "Вы забаранілі выкарыстанне месцазнаходжання",
                                 message: "Мабыць змянiць?",
                                 url: URL(string: UIApplication.openSettingsURLString))
            case .restricted, .notDetermined:
                break
            @unknown default:
                break
            }
        }
    
    private func showAlertLocation(title: String,
                                   message: String?,
                                   url: URL?) {
        let alert = UIAlertController(title: title, 
                                      message: message,
                                      preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: Alerts.Action.settings.rawValue,
                                           style: .default)
        { (alert) in
            if let url = url {
                UIApplication.shared.open(url, 
                                          options: [:],
                                          completionHandler: nil) }
        }
        let cancelAction = UIAlertAction(title: Alerts.Action.cancel.rawValue,
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension MapEarthViewController: CLLocationManagerDelegate {
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
        locationService.checkAuthorization(with: mapView)
    }
}
