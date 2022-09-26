//
//  GeoViewController.swift
//  VK_app
//
//  Created by Ffhh Qerg on 25.09.2022.
//


import UIKit
import MapKit
import CoreLocation

class GeoViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    private lazy var mapView: MKMapView = {
        let view = MKMapView()
        view.mapType = .standard
        view.showsTraffic = true
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var resetButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = .blue
            button.setTitle("clear", for: .normal)
            button.layer.cornerRadius = 24/2
            button.layer.masksToBounds = true
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(removePins), for: .touchUpInside)
            return button
        }()
    private var locationManager = CLLocationManager()
    var pickupCoordinate: CLLocationCoordinate2D?
    var destinationCoordinate: CLLocationCoordinate2D?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureConstraints()
        mapView.delegate = self
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(pinLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 2
        mapView.addGestureRecognizer(gestureRecognizer)
        
        mapView.isScrollEnabled = true
        mapView.isZoomEnabled = true
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)

    }
    
    
    func showRouteOnMap(pickupCoordinate: CLLocationCoordinate2D, destinationCoordinate: CLLocationCoordinate2D) {

        let sourcePlacemark = MKPlacemark(coordinate: pickupCoordinate, addressDictionary: nil)
        let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate, addressDictionary: nil)

        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)

        let sourceAnnotation = MKPointAnnotation()

        if let location = sourcePlacemark.location {
            sourceAnnotation.coordinate = location.coordinate
        }

        let destinationAnnotation = MKPointAnnotation()

        if let location = destinationPlacemark.location {
            destinationAnnotation.coordinate = location.coordinate
        }

        self.mapView.showAnnotations([sourceAnnotation,destinationAnnotation], animated: true )

        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile

        // Calculate the direction
        let directions = MKDirections(request: directionRequest)

        directions.calculate {
            (response, error) -> Void in

            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }

            let route = response.routes[0]
            self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)

            let rect = route.polyline.boundingMapRect
            self.mapView.setRegion(MKCoordinateRegion(rect), animated: true)
        }
    }
    private func configureConstraints() {
        view.addSubview(mapView)
        view.addSubview(resetButton)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            resetButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 300),
            resetButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            resetButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    @objc func removePins() {
 //       mapView.removeAnnotation(mapView.selectedAnnotations as! MKAnnotation)
    }
    
    @objc func pinLocation(gestureRecognizer: UILongPressGestureRecognizer) {
        if let pickup = pickupCoordinate, let destination = destinationCoordinate {
            showRouteOnMap(pickupCoordinate: pickup, destinationCoordinate: destination)
        }
        if gestureRecognizer.state == .began {
            
            let startPoint = gestureRecognizer.location(in: self.mapView)
            let touchCoordinate = self.mapView.convert(startPoint, toCoordinateFrom: self.mapView)
            
            if pickupCoordinate == nil {
                pickupCoordinate = CLLocationCoordinate2D(latitude: touchCoordinate.latitude, longitude: touchCoordinate.longitude)
            } else {
                destinationCoordinate = CLLocationCoordinate2D(latitude: touchCoordinate.latitude, longitude: touchCoordinate.longitude)
            }

            let annotation = MKPointAnnotation()
            annotation.coordinate = touchCoordinate
            annotation.title = "Точка"
            annotation.subtitle = "Новая точка на карте"
            
            self.mapView.addAnnotation(annotation)
        }
    }
    
    // MARK: - MKMapViewDelegate
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor(red: 17.0/255.0, green: 147.0/255.0, blue: 255.0/255.0, alpha: 1)
        renderer.lineWidth = 5.0
        return renderer
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    class Place: NSObject, MKAnnotation {
        var title: String?
        var coordinate: CLLocationCoordinate2D
        var info: String
        
        init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
            self.title = title
            self.coordinate = coordinate
            self.info = info
        }
        
    }
}
