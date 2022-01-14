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
    
    var parks: [MKMapItem] = []
    
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
    
    @IBAction func whenZoomButtonPressed(_ sender: Any)
    {
        let coordinateSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let center = currentLocation.coordinate
        let region = MKCoordinateRegion(center: center, span: coordinateSpan)
        mapViewA.setRegion(region, animated: true)
    }
    
    @IBAction func whenSearchButtonPressed(_ sender: Any)
    {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "Parks"
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        request.region = MKCoordinateRegion(center: currentLocation.coordinate, span: span)
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
        guard let response = response else { return }
        for mapItem in response.mapItems {
        self.parks.append(mapItem)
        let annotation = MKPointAnnotation()
        annotation.coordinate = mapItem.placemark.coordinate
        annotation.title = mapItem.name
        self.mapViewA.addAnnotation(annotation)
        }
        
    }
        
        
        
    }
    
    
}

