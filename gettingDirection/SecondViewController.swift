//
//  SecondViewController.swift
//  Assignment4
//
//  Created by Abhishek rane on 10/21/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation

class SecondViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate{
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
     //Getting User Location
let manager = CLLocationManager()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations[0]
    let mySpan : MKCoordinateSpan = MKCoordinateSpanMake(1, 1)
    let myLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
    let myRegion :MKCoordinateRegion = MKCoordinateRegionMake(myLocation, mySpan)
    Map.setRegion(myRegion, animated: true)
    self.Map.showsUserLocation = true
    }
    
    override func viewDidLoad() {
    super.viewDidLoad()
        self.searchBar.delegate = self
    manager.delegate = self
    manager.requestWhenInUseAuthorization()
    manager.requestAlwaysAuthorization()
    searchBar.delegate = self
    
    if CLLocationManager.locationServicesEnabled(){
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.startUpdatingLocation()
    }
    
        //Centering on San Diego
    let span : MKCoordinateSpan = MKCoordinateSpanMake(0.6,0.6)
    let location : CLLocationCoordinate2D = CLLocationCoordinate2DMake(32.7157,-117.1611)
    let region : MKCoordinateRegion = MKCoordinateRegionMake(location, span)
    Map.setRegion(region, animated:true)
    
        //Labeling ElCajon
    let ElCajon : CLLocationCoordinate2D = CLLocationCoordinate2DMake(32.795042, -116.962349)
    let annotation1 = MKPointAnnotation()
    annotation1.coordinate = ElCajon
    annotation1.title = "ElCajon"
    annotation1.subtitle = "CA"
    Map.addAnnotation(annotation1)
       
        //Labeling Escondido
    let Escondido  : CLLocationCoordinate2D = CLLocationCoordinate2DMake(33.1192,-117.0864)
    let annotation2 = MKPointAnnotation()
    annotation2.coordinate = Escondido
    annotation2.title = "Escondido "
    annotation2.subtitle = "CA"
    Map.addAnnotation(annotation2)
  
//         Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //Searching and getting direction from user location
    
func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    let geooder = CLGeocoder()
    geooder.geocodeAddressString(searchBar.text!) { (placemarks: [CLPlacemark]?, error: Error?) in
       if error == nil{
        
       let placemark = placemarks?.first
       let anno = MKPointAnnotation()
       anno.coordinate = (placemark?.location?.coordinate)!
       anno.title = searchBar.text!
       self.Map.addAnnotation(anno)
       self.Map.selectAnnotation(anno, animated: true)
        
        let Escondi = (placemark?.location?.coordinate)!
        let regionDistance : CLLocationDistance = 800;
        let regionSpan = MKCoordinateRegionMakeWithDistance( Escondi ,regionDistance,regionDistance)
        let options = [MKLaunchOptionsMapCenterKey: NSValue( mkCoordinate :regionSpan.center), MKLaunchOptionsMapSpanKey : NSValue( mkCoordinateSpan : regionSpan.span)]
        let placemark2 = MKPlacemark(coordinate : Escondi)
        let mapItem = MKMapItem(placemark : placemark2)
        mapItem.name = searchBar.text
        mapItem.openInMaps(launchOptions: options)

        }
          else{
                print(error?.localizedDescription ?? "error")
          }
      }
 }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with:event)
        
        self.searchBar.endEditing(true)
    }


}

