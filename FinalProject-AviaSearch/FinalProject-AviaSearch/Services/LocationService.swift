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
    
    func checkLocationPermissions(with map: MKMapView, completion: () -> Void) {
        switch locationManager.authorizationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                map.showsUserLocation = true
                locationManager.startUpdatingLocation()
            case .denied:
                completion()
            case .restricted:
                break
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            @unknown default:
                break
        }
    }
}

