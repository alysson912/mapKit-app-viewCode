//
//  ViewController.swift
//  mapProject-ViewCode
//
//  Created by ALYSSON DODO on 23/05/23.
//

import UIKit
import MapKit
import CoreLocation

class HomeVC: UIViewController {
    
    var locationManager: CLLocationManager?
    
    
    private var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        locationFuncs() // obs: config info.plist: project>info>add new entry>Privacy - Location When In Use Usage Description -> value show message in alert for user :
        
    }
    private func locationFuncs(){
        locationManager = CLLocationManager()
         locationManager?.delegate = self
        
         locationManager?.requestWhenInUseAuthorization() // usa localizacao enquanto estiver usando o app
        locationManager?.requestLocation()

    }

}

extension HomeVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
