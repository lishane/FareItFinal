//
//  Location.swift
//  FareIt
//
//  Created by Apple on 10/17/15.
//  Copyright © 2015 FareIt. All rights reserved.
//


import Foundation
import CoreLocation

class UserLocation: NSObject, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager = CLLocationManager()
    
    var latitude: Double!
    var longitude: Double!
    
    var requested: Bool = false
    func requestLocation() {
        if self.requested {
            return
        }
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            self.requested = true
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        if location?.horizontalAccuracy > 0 {
            self.longitude = location?.coordinate.longitude
            self.latitude = location?.coordinate.latitude
            
            let nc = NSNotificationCenter.defaultCenter()
            nc.postNotificationName("User Location Updated", object: nil)
            self.locationManager.stopUpdatingLocation()
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func getLocation() {
        self.requestLocation()
    }
    
    var getLatitude: Double {
        get {
            return self.latitude
        }
    }
    
    var getLongitude: Double {
        get {
            return self.longitude
        }
    }
    
    var location: CLLocation {
        get {
            return CLLocation(latitude: self.latitude, longitude: self.longitude)
        }
    }
    
}

