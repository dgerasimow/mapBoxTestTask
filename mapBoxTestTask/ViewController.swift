//
//  ViewController.swift
//  mapBoxTestTask
//
//  Created by Danil Gerasimov on 12.10.2021.
//

import UIKit
import Mapbox

class ViewController: UIViewController {
    var field: Field?
    var token: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mapView = MGLMapView(frame: self.view.frame)

        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        mapView.delegate = self
        view.addSubview(mapView)
        
        let auth: AuthorizationRequest = AuthorizationRequest()
        auth.getTokenRequest { auth in
            self.token = auth!.access
            let fieldRequest: FieldsRequest = FieldsRequest()
            fieldRequest.getTokenRequest(token: self.token) { field in
                self.field = field
                mapView.setCenter(CLLocationCoordinate2D(latitude: field?.items[1].fieldLat ?? 45, longitude: field?.items[1].fieldLon ?? 45), zoomLevel: 13, animated: false)
                field?.items.forEach({ field in
                    var polygonCoordinates = [CLLocationCoordinate2D]()
                    field.fieldPoly.forEach { polysCoords in
                        polygonCoordinates.append(CLLocationCoordinate2D(latitude: polysCoords[0], longitude: polysCoords[1]))
                    }
                    let polygonAnnotation = MGLPolygon(coordinates: polygonCoordinates, count: UInt(polygonCoordinates.count))
                    mapView.addAnnotation(polygonAnnotation)
                })
                
            }
        }
    }
}
extension ViewController: MGLMapViewDelegate {

    func mapView(_ mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return UIColor.systemYellow
    }
}
