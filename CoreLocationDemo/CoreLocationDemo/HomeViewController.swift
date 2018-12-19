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
    
    var locationManager : CLLocationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Current Location"
        
        currentLocation()
    }
    
    func currentLocation() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()
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
            
        } else {
            print("No coordinates")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

