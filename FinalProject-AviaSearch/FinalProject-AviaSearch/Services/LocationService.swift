//
//  LocationService.swift
//  FinalProject-AviaSearch
//
//  Created by Анжелика on 12.03.24.
//

import UIKit
import MapKit

protocol LocationServiceProtocol {
    func checkLocationPermissions(with map: MKMapView, completion: @escaping () -> Void)
}

final class LocationService: LocationServiceProtocol {
    
    let locationManager = CLLocationManager()
    
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

extension CLLocationManager {
    static func locationServicesEnabledThreadSafe(completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().async {
            let result = CLLocationManager.locationServicesEnabled()
                DispatchQueue.main.async {
                    completion(result)
         }
      }
   }
}

