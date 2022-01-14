//
//  ViewController.swift
//  MobileMapperHackwich
//
//  Created by Kenneth Johnson on 1/12/22.
//

import MapKit
import UIKit


class ViewController: UIViewController, CLLocationManagerDelegate
{

    @IBOutlet weak var mapViewA: MKMapView!
    
    var currentLocation: CLLocation!
    
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
        mapViewA.showsUserLocation = true
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func locationmanager(_manager: CLLocationManager, didupdateLocations locations: [CLLocation])
    {
        currentLocation = locations[0]
    }
    
    
    
    
}

