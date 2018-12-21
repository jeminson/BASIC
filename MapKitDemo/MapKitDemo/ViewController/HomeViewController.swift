//
//  ViewController.swift
//  MapKitDemo
//
//  Created by Je Min Son on 12/21/18.
//  Copyright © 2018 Jason Son. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var coordinateLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Home"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? MapViewController {
            dest.delegate = self
        }
    }
    
    @IBAction func openMapBarBtnAction(_ sender: UIBarButtonItem) {
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "openMap", sender: nil)
        }
    }
}

extension HomeViewController: MapDelegate {
    func cityValue(cityName: String, lat: Double, long: Double) {
        
        DispatchQueue.main.async {
            self.cityNameLabel.text = cityName
            self.coordinateLabel.text = "\(lat), \(long)"
        }
        
    }
    
}
