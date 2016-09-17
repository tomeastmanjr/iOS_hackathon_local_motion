//
//  mapViewController.swift
//  testProjectSwitft3wCoreData
//
//  Created by Tom Eastman on 9/16/16.
//  Copyright © 2016 Tom Eastman. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class mapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate  {
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        locationManager = CLLocationManager()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.delegate = self;
        let status = CLLocationManager.authorizationStatus()
        if status == .notDetermined || status == .denied || status == .authorizedWhenInUse {
            // present an alert indicating location authorization required
            // and offer to take the user to Settings for the app via
            // UIApplication -openUrl: and UIApplicationOpenSettingsURLString
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.mapType = MKMapType(rawValue: 0)!
        mapView.userTrackingMode = MKUserTrackingMode(rawValue: 2)!
        
    }
    
    var startLocation:CLLocation!
    var lastLocation: CLLocation!
    var traveledDistance:Double = 0

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if startLocation == nil {
            startLocation = locations.first
        } else {
            if let lastLocation = locations.last {
                let distance = startLocation.distance(from: lastLocation)
                let lastDistance = lastLocation.distance(from: lastLocation)
                traveledDistance += lastDistance
                print( "\(startLocation)")
                print( "\(lastLocation)")
                print("FULL DISTANCE: \(traveledDistance)")
                print("STRAIGHT DISTANCE: \(distance)")
                if distance > 150.0{
                    performSegue(withIdentifier: "toShake", sender: Any?.self )
                    
                }
            }
        }
        lastLocation = locations.last
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
        let userLocation:CLLocation = locations[0]
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;

        
        print("this is long....\(long)")
        print("this is lat....\(Double(lat))")
        print("this is center....\(center)")
        print("this is center.latitude....\(center.latitude)")
        print("this is center.longitude....\(center.longitude)")
        print("this is locations.first....\(locations.first)")
        
    }
    

}
