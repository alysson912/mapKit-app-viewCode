//
//  HomeScreen.swift
//  mapProject-ViewCode
//
//  Created by ALYSSON DODO on 23/05/23.
//

import UIKit
import MapKit

class HomeScreen: UIView {
    
    
    lazy var mapView: MKMapView = {
       let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.showsUserLocation = true
        
        map.clipsToBounds = true
        map.layer.cornerRadius = 10
        map.setCardShadow()
        return map
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addViews()
        setupConstraints()
    }
    
    private func addViews(){
        addSubview(mapView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
        
            mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            mapView.heightAnchor.constraint(equalToConstant: 500),
            
        ])
    }
}
