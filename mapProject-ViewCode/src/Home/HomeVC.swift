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
        locationManager?.requestAlwaysAuthorization()// usa localizacao sempre ativa 
         locationManager?.requestWhenInUseAuthorization() // usa localizacao enquanto estiver usando o app
        locationManager?.requestLocation()

    }

    private func checkLocationAutorization(){
        guard let locationManager = locationManager,
              let location = locationManager.location else { return }
        
        switch locationManager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 750, longitudinalMeters: 750)
            screen?.mapView.setRegion(region, animated: true)
        case .denied:
            print("")
        case .notDetermined, .restricted:
            print("")
        @unknown default:
            print("")
        }
    }
    
}

extension HomeVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAutorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
