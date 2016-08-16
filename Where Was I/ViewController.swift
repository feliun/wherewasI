//
//  ViewController.swift
//  Where Was I
//
//  Created by Gibbonsoft Limited on 14/08/2016.
//  Copyright © 2016 feliun. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    @IBAction func SaveButtonClicked(_ sender: UIBarButtonItem) {
        let coord = locationManager.location?.coordinate
        if let lat = coord?.latitude {
            if let long = coord?.longitude {
                DataStore().storeDataPoint(lat: String(lat), long: String(long))
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        if let lastCoords = DataStore().getLastLocation() {
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(lastCoords.latitude)!
            annotation.coordinate.longitude = Double(lastCoords.longitude)!
            
            annotation.title = "I was here!"
            annotation.subtitle = "remember?"
            mapView.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            print("Location not enabled!")
            return
        }
        
        print("Location allowed")
        mapView.showsUserLocation = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

