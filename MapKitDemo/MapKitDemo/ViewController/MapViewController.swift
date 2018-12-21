//
//  MapViewController.swift
//  MapKitDemo
//
//  Created by Je Min Son on 12/21/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

protocol MapDelegate {
    func cityValue(cityName: String, lat: Double, long: Double)
}

class MapViewController: UIViewController {

    @IBOutlet weak var appleMapView: MKMapView!
    
    var locationManager = CLLocationManager()
    var delegate: MapDelegate?
    let regionRadius: CLLocationDistance = 1000
    let annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Map View"

        currentLocation()
    }
    
}

extension MapViewController {
    func currentLocation() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
//        self.locationManager.requestLocation()
        self.locationManager.startUpdatingLocation()        // Faster speed
    }
    
    func centerMapOnCurrentLocation(location: CLLocation) {
    
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        // setRegion tells mapView to display the region
        appleMapView.setRegion(coordinateRegion, animated: true)
        // Annotation is to add the Pins into the MapKit
        annotation.coordinate = CLLocationCoordinate2D(latitude: (locationManager.location?.coordinate.latitude)!, longitude: (locationManager.location?.coordinate.longitude)!)
            
        DispatchQueue.main.async {
            self.annotation.title = "Current Location"
            self.appleMapView.addAnnotation(self.annotation)
        }
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

// MARK : - CLLocation Manager Delegate
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
            
            let currentLocationCoordinate = CLLocation(latitude: lat, longitude: long)
            centerMapOnCurrentLocation(location: currentLocationCoordinate)
            
            lookUpCurrentLocation { placeMark in
                self.delegate?.cityValue(cityName: (placeMark?.locality)!, lat: lat, long: long)
            }
            
        } else {
            print("No coordinates")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}
