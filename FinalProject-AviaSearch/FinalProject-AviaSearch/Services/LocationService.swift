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
    
    var locationServiceEnabled: Bool { return CLLocationManager.locationServicesEnabled() }

    func checkAuthorization(with map: MKMapView) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            map.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            //showAlertLocation(title: "Вы забаранілі выкарыстанне месцазнаходжання",
            //                  message: "Мабыць змянiць?",
            //                  url: URL(string: UIApplication.openSettingsURLString))
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        @unknown default:
            break
        }
    }
}

