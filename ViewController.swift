import UIKit
import MapKit
import CoreLocation
import AVFoundation

class CustomPointAnnotation: MKPointAnnotation{
    var imageName: String!
}


class ViewController: UIViewController  {
    var jacarandaPin = CustomPointAnnotation()
    var libraryPin = CustomPointAnnotation()
    var bayramianPin = CustomPointAnnotation()
    var liveOakPin = CustomPointAnnotation()
    var sequoiaPin = CustomPointAnnotation()
    var chaparralPin = CustomPointAnnotation()
    var eucalyptusPin = CustomPointAnnotation()
    var citrusPin = CustomPointAnnotation()
    var booksteinPin = CustomPointAnnotation()
    var cypressPin = CustomPointAnnotation()
    var nordhoffPin = CustomPointAnnotation()
    var redwoodPin = CustomPointAnnotation()
    var valleyPin = CustomPointAnnotation()
    var sagebrushPin = CustomPointAnnotation()
    var sierraPin = CustomPointAnnotation()
    var srcPin = CustomPointAnnotation()
    var usuPin = CustomPointAnnotation()
    var wabaPin = CustomPointAnnotation()
    var ufcGymPin = CustomPointAnnotation()
    var dearbparkPin = CustomPointAnnotation()
    var northridgePacificTheaterPin = CustomPointAnnotation()
    var sanfernMuseumPin = CustomPointAnnotation()
    var lilfreeLibraryPin = CustomPointAnnotation()
    var northridgemiddleSchoolPin = CustomPointAnnotation()
    var northridgeunicenterPin = CustomPointAnnotation()
    var wellsfargoPin = CustomPointAnnotation()
    var oneWestBankPin = CustomPointAnnotation()
    var unionBankPin = CustomPointAnnotation()
    var chaseBankPin = CustomPointAnnotation()
    var gas76Pin = CustomPointAnnotation()
    var dearbornParkPin = CustomPointAnnotation()
    var vanaldenParkPin = CustomPointAnnotation()
    var oakridgeEstateParkPin = CustomPointAnnotation()
    var northridgeFashionCenterPin = CustomPointAnnotation()
    var restYardHousePin = CustomPointAnnotation()
    var restBrentsDeliNorthPin = CustomPointAnnotation()
    var starbucksPin = CustomPointAnnotation()
    var northBranchLibPin = CustomPointAnnotation()
    var christianLibPin = CustomPointAnnotation()
    var usBankPin = CustomPointAnnotation()
    var gasChevronPin = CustomPointAnnotation()
    
    var optionString = ""
   
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var matadorLocation: UIButton!
    
    var menuOut = false
    
    @IBAction func matadorClicked(_ sender: Any) {
        userLocation()
    }
    
    @IBAction func educationalClicked(_ sender: Any) {
        optionString = "Lecture Halls"
        leading.constant = -30
        trailing.constant = 0
        menuOut = false
    }
    
    @IBAction func gasClicked(_ sender: Any) {
        optionString = "Gas Stations"
        leading.constant = -30
        trailing.constant = 0
        menuOut = false
    }
    
    @IBAction func restaurantClicked(_ sender: Any) {
        optionString = "Restaurants"
        leading.constant = -30
        trailing.constant = 0
        menuOut = false
    }
    
    @IBAction func menuOptions(_ sender: Any) {
        if menuOut == false{
            leading.constant = 170
            trailing.constant = -170
            menuOut = true
        }
        else{
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
        }
    }
    

    
    
    let locationManager = CLLocationManager()
    var currentCoordinate: CLLocationCoordinate2D!
    
    var steps = [MKRoute.Step]()
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var stepCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self

        
        let distanceSpan: CLLocationDegrees = 500
        let bsCSUNCAmpusLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(34.241464890869224, -118.52937457790358)
        mapView.setRegion(MKCoordinateRegion(center: bsCSUNCAmpusLocation, latitudinalMeters: distanceSpan, longitudinalMeters: distanceSpan), animated: true)
        
       
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
        
        let jacarandaCoordinates = CLLocationCoordinate2DMake(34.241153, -118.528926)
        jacarandaPin.coordinate = jacarandaCoordinates
        jacarandaPin.title = "Jacaranda Hall"
        jacarandaPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(jacarandaPin)
        
        let libraryCoordinates = CLLocationCoordinate2DMake(34.240032, -118.529318)
        libraryPin.coordinate = libraryCoordinates
        libraryPin.title = "Oviatt Library"
        libraryPin.imageName = "oviatt.png"
        mapView.addAnnotation(libraryPin)
        
        let bayramianCoordinates = CLLocationCoordinate2DMake(34.240479, -118.530862)
        bayramianPin.coordinate = bayramianCoordinates
        bayramianPin.title = "Bayramian Hall"
        bayramianPin.imageName = "bayramian.png"
        mapView.addAnnotation(bayramianPin)
        
        let liveOakCoordinates = CLLocationCoordinate2DMake(34.238448, -118.528219)
        liveOakPin.coordinate = liveOakCoordinates
        liveOakPin.title = "Live Oak Hall"
        liveOakPin.imageName = "live oak.png"
        mapView.addAnnotation(liveOakPin)
        
        let sequoiaCoordinates = CLLocationCoordinate2DMake(34.240639, -118.528243)
        sequoiaPin.coordinate = sequoiaCoordinates
        sequoiaPin.title = "Sequoia Hall"
        sequoiaPin.imageName = "sequoia.png"
        mapView.addAnnotation(sequoiaPin)
        
        let chaparralCoordinates = CLLocationCoordinate2DMake(34.238342, -118.527128)
        chaparralPin.coordinate = chaparralCoordinates
        chaparralPin.title = "Chaparral Hall"
        chaparralPin.imageName = "chaparall.png"
        mapView.addAnnotation(chaparralPin)
        
        let citrusCoordinates = CLLocationCoordinate2DMake(34.239096, -118.528073)
        citrusPin.coordinate = citrusCoordinates
        citrusPin.title = "Citrus Hall"
        citrusPin.imageName = "citrus.png"
        mapView.addAnnotation(citrusPin)
        
        let eucalyptusCoordinates = CLLocationCoordinate2DMake(34.238730, -118.528118)
        eucalyptusPin.coordinate = eucalyptusCoordinates
        eucalyptusPin.title = "Eucalyptus Hall"
        eucalyptusPin.imageName = "Eucalyptus.png"
        mapView.addAnnotation(eucalyptusPin)
        
        let booksteinCoordinates = CLLocationCoordinate2DMake(34.242014, -118.530814)
        booksteinPin.coordinate = booksteinCoordinates
        booksteinPin.title = "Bookstein Hall"
        booksteinPin.imageName = "bookstein.png"
        mapView.addAnnotation(booksteinPin)
        
        let cypressCoordinates = CLLocationCoordinate2DMake(34.236194, -118.529698)
        cypressPin.coordinate = cypressCoordinates
        cypressPin.title = "Cypress Hall"
        cypressPin.imageName = "cypress.png"
        mapView.addAnnotation(cypressPin)
        
        let nordhoffCoordinates = CLLocationCoordinate2DMake(34.236381, -118.530644)
        nordhoffPin.coordinate = nordhoffCoordinates
        nordhoffPin.title = "Nordhoff Hall"
        nordhoffPin.imageName = "nordhoff.png"
        mapView.addAnnotation(nordhoffPin)
        
        let redwoodCoordinates = CLLocationCoordinate2DMake(34.242042, -118.526355)
        redwoodPin.coordinate = redwoodCoordinates
        redwoodPin.title = "Redwood Hall"
        redwoodPin.imageName = "redwood.png"
        mapView.addAnnotation(redwoodPin)
        
        let valleyCoordinates = CLLocationCoordinate2DMake(34.235926, -118.528006)
        valleyPin.coordinate = valleyCoordinates
        valleyPin.title = "Younes and Soraya Nazarian Center for the Performing Arts"
        valleyPin.imageName = "valley.png"
        mapView.addAnnotation(valleyPin)
        
        let sagebrushCoordinates = CLLocationCoordinate2DMake(34.242549, -118.528469)
        sagebrushPin.coordinate = sagebrushCoordinates
        sagebrushPin.title = "Sagebrush Hall"
        sagebrushPin.imageName = "sagebrush.png"
        mapView.addAnnotation(sagebrushPin)
        
        let sierraCoordinates = CLLocationCoordinate2DMake(34.238220, -118.530780)
        sierraPin.coordinate = sierraCoordinates
        sierraPin.title = "Sierra Hall"
        sierraPin.imageName = "sierra.png"
        mapView.addAnnotation(sierraPin)
        
        let srcCoordinates = CLLocationCoordinate2DMake(34.239856, -118.524904)
        srcPin.coordinate = srcCoordinates
        srcPin.title = "Student Recreation Center"
        srcPin.imageName = "src.png"
        mapView.addAnnotation(srcPin)
        
        let usuCoordinates = CLLocationCoordinate2DMake(34.240049, -118.525809)
        usuPin.coordinate = usuCoordinates
        usuPin.title = "Student Recreation Center"
        usuPin.imageName = "usu.png"
        mapView.addAnnotation(usuPin)
        //userLocation()
        
       let wabaCoordinates = CLLocationCoordinate2DMake(34.2358, -118.5348)
        wabaPin.coordinate = wabaCoordinates
        wabaPin.title = "WaBa Grill"
//        wabaPin.imageName = "*insert waba grill photo*"
        mapView.addAnnotation(wabaPin)

        let ufcGymCoordinates =
            CLLocationCoordinate2DMake(34.2370, -118.5354)
        ufcGymPin.coordinate = ufcGymCoordinates
        ufcGymPin.title = "UFC GYM Northridge"
        mapView.addAnnotation(ufcGymPin)
        
        let dearbparkCoordinates =
            CLLocationCoordinate2DMake(34.2374, -118.5079)
        dearbparkPin.coordinate = dearbparkCoordinates
        dearbparkPin.title = "Dearborn Park"
        dearbparkPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(dearbparkPin)
        
        let northridgePacificTheaterCoordinates =
            CLLocationCoordinate2DMake(34.2412, -118.5579)
        northridgePacificTheaterPin.coordinate = northridgePacificTheaterCoordinates
        northridgePacificTheaterPin.title = "Northridge Pacific Theaters"
        northridgePacificTheaterPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(northridgePacificTheaterPin)
        
        let sanfernMuseumCoordinates =
            CLLocationCoordinate2DMake(34.2355, -118.5443)
        sanfernMuseumPin.coordinate = sanfernMuseumCoordinates
        sanfernMuseumPin.title = "The Musuem of the San Fernando Valley"
        sanferMuseumPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(sanfernMuseumPin)
        
        let lilfreeLibraryCoordinates =
            CLLocationCoordinate2DMake(34.2295, -118.5671)
        lilfreeLibraryPin.coordinate = lilfreeLibraryCoordinates
        lilfreeLibraryPin.title = "Little Free Library"
        mapView.addAnnotation(lilfreeLibraryPin)
        
        let northridgemiddleschoolCoordinates =
            CLLocationCoordinate2DMake(34.2246, -118.5234)
        northridgemiddleSchoolPin.coordinate = northridgemiddleschoolCoordinates
        northridgemiddleSchoolPin.title = "Northridge Middle School"
        mapView.addAnnotation(northridgemiddleSchoolPin)
        
        let northridgeunicenterCoordinates =
            CLLocationCoordinate2DMake(34.2367, -118.5370)
        northridgeunicenterPin.coordinate = northridgeunicenterCoordinates
        northridgeunicenterPin.title = "Northridge University Center"
        mapView.addAnnotation(northridgeunicenterPin)
        
        let wellsfargoCoordinates =
            CLLocationCoordinate2DMake(34.2399, -118.5264)
        wellsfargoPin.coordinate = wellsfargoCoordinates
        wellsfargoPin.title = "Wells Fargo Bank"
        wellsfargoPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(wellsfargoPin)
        
        let oneWestBankCoordinates =
            CLLocationCoordinate2DMake(34.229080, -118.553620)
        oneWestBankPin.coordinate = oneWestBankCoordinates
        oneWestBankPin.title = "oneWest Bank"
        oneWestBankPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(oneWestBankPin)
        
        let unionBankCoordinates =
            CLLocationCoordinate2DMake(34.2358, -118.5536)
        unionBankPin.coordinate = unionBankCoordinates
        unionBankPin.title = "Union Bank"
        unionBankPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(unionBankPin)
        
        let chaseBankCoordinates =
            CLLocationCoordinate2DMake(34.053750, -117.486840)
        chaseBankPin.coordinate = chaseBankCoordinates
        chaseBankPin.title = "Chase Bank"
        chaseBankPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(chaseBankPin)
        
        let gas76Coordinates =
            CLLocationCoordinate2DMake(34.2357, -118.5272)
        gas76Pin.coordinate = gas76Coordinates
        gas76Pin.title = "76"
        gas76Pin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(gas76Pin)
        
        let dearbornParkCoordinates =
            CLLocationCoordinate2DMake(37.2588, -112.3180)
        dearbornParkPin.coordinate = dearbornParkCoordinates
        dearbornParkPin.title = "Dearborn Park"
        dearbornParkPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(dearbornParkPin)
        
        let vanaldenParkCoordinates =
            CLLocationCoordinate2DMake(34.2334, -118.5485)
        vanaldenParkPin.coordinate = vanaldenParkCoordinates
        vanaldenParkPin.title = "Vanalden Park"
        vanaldenParkPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(vanaldenParkPin)
        
        let oakridgeEstateParkCoordinates =
            CLLocationCoordinate2DMake(34.2569, -118.5410)
        oakridgeEstateParkPin.coordinate = oakridgeEstateParkCoordinates
        oakridgeEstateParkPin.title = "Oakridge Estate Park"
        oakridgeEstateParkPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(oakridgeEstateParkPin)
        
        let northridgeFashionCenterCoordinates =
            CLLocationCoordinate2DMake(34.2385, -118.5561)
        northridgeFashionCenterPin.coordinate = northridgeFashionCenterCoordinates
        northridgeFashionCenterPin.title = "Northridge Fashion Center"
        northridgeFashionCenterPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(northridgeFashionCenterPin)
        
        let restYardHouseCoordinates =
            CLLocationCoordinate2DMake(34.2407, -118.5563)
        restYardHousePin.coordinate = restYardHouseCoordinates
        restYardHousePin.title = "Restaurant Yard House"
        restYardHousePin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(restYardHousePin)
        
        let restBrentsDeliNorthCoordinates =
            CLLocationCoordinate2DMake(34.2289, -118.5603)
        restBrentsDeliNorthPin.coordinate = restBrentsDeliNorthCoordinates
        restBrentsDeliNorthPin.title = "Restaurant Brent's Deli Northridge"
        restBrentDeliNorthPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(restBrentsDeliNorthPin)
        
        let starbucksCoordinates =
            CLLocationCoordinate2DMake(34.25639, -118.53618)
        starbucksPin.coordinate = starbucksCoordinates
        starbucksPin.title = "Starbucks"
        starbucksPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(starbucksPin)
        
        let northBranchLibCoordinates =
            CLLocationCoordinate2DMake(34.2348,-118.534100)
        northBranchLibPin.coordinate = northBranchLibCoordinates
        northBranchLibPin.title = "Northridge Branch Library"
        northBranchLibPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(northBranchLibPin)
        
        let christianLibCoordinates =
            CLLocationCoordinate2DMake(34.220780,-118.553180)
        christianLibPin.coordinate = christianLibCoordinates
        christianLibPin.title = "Christian Library"
        christianLibPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(christianLibPin)
        
        let usBankCoordinates =
            CLLocationCoordinate2DMake(34.2427,-118.5568)
        usBankPin.coordinate = usBankCoordinates
        usBankPin.title = "us Bank"
        usbankPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(usBankPin)
        
        let gasChevronCoordinates =
            CLLocationCoordinate2DMake(34.2351,-118.553110)
        gasChevronPin.coordinate = gasChevronCoordinates
        gasChevronPin.title = "Chevron gas station"
        gasChevronPin.imageName = "Jacaranda Hall.png"
        mapView.addAnnotation(gasChevronPin)
        
        
        
    }
  
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        if !(annotation is MKPointAnnotation){
            print("Not registered")
            return nil
        }
        var annotationvView = mapView.dequeueReusableAnnotationView(withIdentifier: "csunmapIdentifier")
        if annotationvView == nil{
            annotationvView = MKAnnotationView(annotation: annotation, reuseIdentifier: "csunmapIdentifier")
            annotationvView!.canShowCallout = true
        }
        else{
            annotationvView!.annotation = annotation
        }
        let cpa = annotation as! CustomPointAnnotation
        annotationvView!.image = UIImage(named: cpa.imageName)
        return annotationvView
    }
    
    func getDirections(to destination: MKMapItem) {
        
        let sourcePlacemark = MKPlacemark(coordinate: currentCoordinate)
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let directionsRequest = MKDirections.Request()
        directionsRequest.source = sourceMapItem
        directionsRequest.destination = destination
        directionsRequest.transportType = .walking
        steps =  [MKRoute.Step]()
        let directions = MKDirections(request: directionsRequest)
        directions.calculate { (response, _) in
            guard let response = response else { return }
            guard let primaryRoute = response.routes.first else { return }
            
            self.mapView.addOverlay(primaryRoute.polyline)
            
        self.locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })
            
            self.steps = primaryRoute.steps
            for i in 0 ..< primaryRoute.steps.count {
                let step = primaryRoute.steps[i]
                print(step.instructions)
                print(step.distance)
                let region = CLCircularRegion(center: step.polyline.coordinate,
                                              radius: 20,
                                              identifier: "\(i)")
                self.locationManager.startMonitoring(for: region)
                let circle = MKCircle(center: region.center, radius: region.radius)
                self.mapView.addOverlay(circle)
            }
            
            let initialMessage = "In \(self.steps[0].distance) meters, \(self.steps[0].instructions) \(self.steps[1].instructions)."
            let speechUtterance = AVSpeechUtterance(string: initialMessage)
            self.speechSynthesizer.speak(speechUtterance)
            self.stepCounter += 1
        }
    }
    
    override func didReceiveMemoryWarning() {
               super.didReceiveMemoryWarning()
               // Dispose of any resources that can be recreated.
           }
          
           private func userLocation(){
               guard let coordinate = locationManager.location?.coordinate else{return}
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
               mapView.setRegion(region, animated: true)
           }
           
           private func beginLocationUpdates(locationManager: CLLocationManager) {
               mapView.showsUserLocation = true
               locationManager.desiredAccuracy = kCLLocationAccuracyBest
               locationManager.startUpdatingLocation()
           }
           
           private func zoomToLatestLocation(with coordinate: CLLocationCoordinate2D) {
            let zoomRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
               mapView.setRegion(zoomRegion, animated: true)
           }
       

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        manager.stopUpdatingLocation()
        guard let currentLocation = locations.first else { return }
        currentCoordinate = currentLocation.coordinate
        mapView.userTrackingMode = .followWithHeading
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("ENTERED")
        stepCounter += 1
        if stepCounter < steps.count {
            let currentStep = steps[stepCounter]
            let message = "In \(currentStep.distance) meters, \(currentStep.instructions)"
            let speechUtterance = AVSpeechUtterance(string: message)
            speechSynthesizer.speak(speechUtterance)
        } else {
            let message = "Arrived at destination"
            let speechUtterance = AVSpeechUtterance(string: message)
            speechSynthesizer.speak(speechUtterance)
            stepCounter = 0
            locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })
            
        }
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.mapView.removeOverlays(mapView.overlays)
        searchBar.endEditing(true)
        let localSearchRequest = MKLocalSearch.Request()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        let region = MKCoordinateRegion(center: currentCoordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        localSearchRequest.region = region
        userLocation()
        let localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.start { (response, _) in
            guard let response = response else { return }
            guard let firstMapItem = response.mapItems.first else { return }
            self.getDirections(to: firstMapItem)
        }
        
    }
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .red
            renderer.lineWidth = 10
            return renderer
        }
        if overlay is MKCircle {
            let renderer = MKCircleRenderer(overlay: overlay)
            renderer.strokeColor = .black
            renderer.fillColor = .red
            renderer.alpha = 0.5
            return renderer
        }
        return MKOverlayRenderer()
    }
}

