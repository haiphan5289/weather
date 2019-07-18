//
//  LocationService.swift
//  weather_app
//
//  Created by HaiPhan on 7/18/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation
import CoreLocation

class LocationServices: NSObject {

    var newslocation: ((CLLocationCoordinate2D?) -> Void)?
    var manage: CLLocationManager
    init(manage: CLLocationManager = CLLocationManager()) {
        self.manage = manage
        super.init()
        manage.delegate = self
    }
    var updatestatus: ((CLAuthorizationStatus?) -> Void )?
    var status: CLAuthorizationStatus {
        return CLLocationManager.authorizationStatus()
    }
    func get_permission(){
        manage.requestWhenInUseAuthorization()
    }
    
    func get_location(){
        manage.requestLocation()
    }
}
extension LocationServices: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.sorted(by: { $0.timestamp > $1.timestamp }).first {
            self.newslocation?(location.coordinate)
        }
        else {
            self.newslocation?(nil)
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error\(error.localizedDescription)")
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Status\(status)")
        self.updatestatus?(status)
    }
    
}
