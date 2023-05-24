//
//  HomeScreen.swift
//  mapProject-ViewCode
//
//  Created by ALYSSON DODO on 23/05/23.
//

import UIKit
import MapKit
import CoreLocation 

class HomeScreen: UIView {
    
   

    
    
    lazy var mapView: MKMapView = {
       let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        map.showsUserLocation = true
        
        map.setCardShadow()
        return map
    }()
    
    lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress // defaut
        tf.placeholder = "buscar:"
        tf.textColor = .darkGray
        tf.isSecureTextEntry = false
        return tf
    }()
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addViews()
        setupConstraints()
    }
    
    private func addViews(){
    
        addSubview(mapView)
        mapView.addSubview(searchTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
      
        mapView.pin(to: self)
        
        NSLayoutConstraint.activate([
        
            searchTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 35),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35)
            
        ])
    }
}
