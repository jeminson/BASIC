//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Je Min Son on 12/19/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController {

    @IBOutlet weak var currentLatitudeLabel: UILabel!
    @IBOutlet weak var currentLongitudeLabel: UILabel!
    @IBOutlet weak var currentCityNameLabel: UILabel!
    
    var locationManager : CLLocationManager = CLLocationManager()
    let dispatchGroup = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Current Location"
        
        currentLocation()
        
    }
    
}


extension HomeViewController {
    func currentLocation() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.requestLocation()
        self.locationManager.startUpdatingLocation()
    }
    
    func lookUpCurrentLocation(completionHandler: @escaping (CLPlacemark?) -> Void ) {
        // Use the last reported location.
        if let lastLocation = self.locationManager.location {
            let geocoder = CLGeocoder()
            
            // Look up the location and pass it to the completion handler
            geocoder.reverseGeocodeLocation(lastLocation, completionHandler: { (placemarks, error) in
                if error == nil {
                    let firstLocation = placemarks?[0]
                    completionHandler(firstLocation)
                }
                else {
                    // An error occurred during geocoding.
                    completionHandler(nil)
                }
            })
        } else {
            // No location was available.
            completionHandler(nil)
        }
    }
}

// MARK: - CCLocationManager Delegate
extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
            
            DispatchQueue.main.async {
                self.currentLatitudeLabel.text = "\(lat)"
                self.currentLongitudeLabel.text = "\(long)"
            }
            self.lookUpCurrentLocation { placeMark in
                DispatchQueue.main.async {
                    self.currentCityNameLabel.text = "\((placeMark?.locality)!)"
                }
            }
            
        } else {
            print("No coordinates")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

