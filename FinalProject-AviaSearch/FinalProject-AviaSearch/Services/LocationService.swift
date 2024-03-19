//
//  LocationService.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 12.03.24.
//

import UIKit
import MapKit

final class LocationService {
    
    let locationManager = CLLocationManager()
    
    var locationServiceEnabled: Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    func checkAuthorization(with map: MKMapView) {
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .denied, .restricted:
            break
        case .authorizedWhenInUse:
            map.showsUserLocation = true
            locationManager.startUpdatingLocation()
        case .notDetermined:
            DispatchQueue.global().async {
                self.locationManager.requestWhenInUseAuthorization()
            }
        @unknown default:
            break
        }
    }
}

