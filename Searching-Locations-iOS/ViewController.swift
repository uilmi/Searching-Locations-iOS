//
//  ViewController.swift
//  Searching-Locations-iOS
//
//  Created by Ulul I. on 05/10/22.
//

import UIKit
import MapKit
import FloatingPanel
import CoreLocation

class ViewController: UIViewController, SearchViewControllerDelegate {

    let mapView = MKMapView()
    let panel = FloatingPanelController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        title = "TUJU"
        
        let searchVC = Searching_Locations_iOS.SearchViewController()
        searchVC.delegate = self
        
        panel.set(contentViewController: searchVC)
        panel.addPanel(toParent: self)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.frame = view.bounds
    }
    
    
    func SearchViewController(_ vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {
        
        guard let coordinates = coordinates else {
            return
        }

        panel.move(to: .tip, animated: true)
        
        mapView.removeAnnotations(mapView.annotations)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
        
        mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(
            latitudeDelta: 0.7,
            longitudeDelta: 0.7
            )
        ), animated: true)
    }

}

