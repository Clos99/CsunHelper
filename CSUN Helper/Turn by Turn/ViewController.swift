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
    var gas76Pin = CustomPointAnnotation()
    
    var eduPins: [CustomPointAnnotation] = []
    var gasPins: [CustomPointAnnotation] = []
    var restaurantPins: [CustomPointAnnotation] = []
    var libraryPins: [CustomPointAnnotation] = []
    var parkPins: [CustomPointAnnotation] = []
    var hotelPins: [CustomPointAnnotation] = []
    var schoolPins: [CustomPointAnnotation] = []
    var mallPins: [CustomPointAnnotation] = []
    var bankPins: [CustomPointAnnotation] = []
    var moviePins: [CustomPointAnnotation] = []
    var museumPins: [CustomPointAnnotation] = []
    
    var optionString = ""
   
    @IBOutlet weak var trailing: NSLayoutConstraint!
    @IBOutlet weak var leading: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var matadorLocation: UIButton!
    
    var menuOut = false
    var lec = false
    var res = false
    var gas = false
    var lib = false
    var hot = false
    var par = false
    var sch = false
    var mal = false
    var ban = false
    var mov = false
    var mus = false
    
    var eduOn = false
    var gasOn = false
    var resOn = false
    var libOn = false
    var parOn = false
    var hotOn = false
    var schOn = false
    var malOn = false
    var banOn = false
    var movOn = false
    var musOn = false
    
    
    func turnOnPins(_ buildingPins: [CustomPointAnnotation]){
        for pin in buildingPins {
            //mapView.addAnnotation(pins.title() as !MKAnnotation)
            mapView.addAnnotation(pin)
        }
    }
    
    func turnOffPins(_ buildingPins:[CustomPointAnnotation]){
        for pin in buildingPins {
            mapView.removeAnnotation(pin)
        }
    }
    
    @IBAction func camera(_ sender: Any) {
        let sb = storyboard?.instantiateViewController(withIdentifier: "viewcontroller2") as! ARCLViewController
        if lec {
            sb.passText = "Lecture Halls"
            present(sb, animated: true, completion: nil)
            res = false
            gas = false
            lib = false
            hot = false
            par = false
            sch = false
            
        }
        if res {
            sb.passText = "Restaurants"
            present(sb, animated: true, completion: nil)
            lec = false
            gas = false
            lib = false
            hot = false
            par = false
            sch = false
            
        }
        if gas {
            sb.passText = "Gas Stations"
            present(sb, animated: true, completion: nil)
            lec = false
            res = false
            lib = false
            hot = false
            par = false
            sch = false
            
        }
        if lib {
            sb.passText = "Libraries"
            present(sb, animated: true, completion: nil)
            lec = false
            res = false
            gas = false
            hot = false
            par = false
            sch = false
            
        }
        if hot{
            sb.passText = "Hotels"
            present(sb, animated: true, completion: nil)
            lec = false
            res = false
            gas = false
            lib = false
            par = false
            sch = false
            
            
        }
        if par{
            sb.passText = "Parks"
            present(sb, animated: true, completion: nil)
            lec = false
            res = false
            gas = false
            lib = false
            hot = false
            sch = false
            
        }
        if sch {
            sb.passText = "Schools"
            present(sb, animated: true, completion: nil)
            lec = false
            res = false
            gas = false
            lib = false
            hot = false
            hot = false
            
        }
        sb.passText = "Waba Grill"
        present(sb, animated: true, completion: nil)
        lec = false
        res = false
        gas = false
        lib = false
        hot = false
        hot = false
        sch = false
    }
    @IBAction func matadorClicked(_ sender: Any) {
        userLocation()
    }
    
    @IBAction func educationalClicked(_ sender: Any) {
        //need to test
        if (eduOn == false){
            optionString = "Educational Building"
            turnOnPins(eduPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            lec = true
            eduOn = true
        }
        else {
            optionString = ""
            turnOffPins(eduPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            lec = false
            eduOn = false
        }
        
    }
    
    @IBAction func gasClicked(_ sender: Any) {
        if (gasOn == false){
            optionString = "Gas Station"
            turnOnPins(gasPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            gas = true
            gasOn = true
        }
        else {
            optionString = ""
            turnOffPins(gasPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            gas = false
            gasOn = false
        }
    }
    
    @IBAction func restaurantClicked(_ sender: Any) {
        if (resOn == false){
            optionString = "Restaurant"
            turnOnPins(restaurantPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            res = true
            resOn = true
        } else {
            optionString = ""
            turnOffPins(restaurantPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            res = false
            resOn = false
        }
    }
    
    @IBAction func librarytClicked(_ sender: Any) {
        if (libOn == false) {
            optionString = "Libraries"
            turnOnPins(libraryPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            lib = true
            libOn = true
        } else {
            optionString = ""
            turnOffPins(libraryPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            lib = false
            libOn = false
        }
    }
    
    @IBAction func parkClicked(_ sender: Any) {
        if (parOn == false){
            optionString = "Parks"
            turnOnPins(parkPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            par = true
            parOn = true
        } else {
            optionString = ""
            turnOffPins(parkPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            par = false
            parOn = false
        }
    }
    
    @IBAction func HotelClicked(_ sender: Any) {
        if (hotOn == false) {
            optionString = "Hotels"
            turnOnPins(hotelPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            hot = true
            hotOn = true
        } else {
            optionString = ""
            turnOffPins(hotelPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            hot = false
            hotOn = false
        }
    }
    
    @IBAction func schoolClicked(_ sender: Any) {
        if (schOn == false) {
            optionString = "Schools"
            turnOnPins(schoolPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            sch = true
            schOn = true
        } else {
            optionString = ""
            turnOffPins(schoolPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            sch = false
            schOn = false
        }
    }
    
    @IBAction func mallsClicked(_ sender: Any) {
        if(malOn == false){
           optionString = "Malls"
           turnOnPins(mallPins)
           leading.constant = -30
           trailing.constant = 0
           menuOut = false
           mal = true
           malOn = true
        } else {
            optionString = ""
            turnOffPins(mallPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            mal = false
            malOn = false
        }
    }
    
    @IBAction func banksClicked(_ sender: Any) {
        if (banOn == false){
           optionString = "Banks"
           turnOnPins(bankPins)
           leading.constant = -30
           trailing.constant = 0
           menuOut = false
           ban = true
           banOn = true
        } else {
            optionString = ""
            turnOffPins(bankPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            ban = false
            banOn = false
        }
    }
    
    @IBAction func movieTClicked(_ sender: Any) {
        if (movOn == false){
           optionString = "Movie Theathers"
           turnOnPins(moviePins)
           leading.constant = -30
           trailing.constant = 0
           menuOut = false
           mov = true
           movOn = true
        } else {
            optionString = ""
            turnOffPins(moviePins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            mov = false
            movOn = false
        }
    }
    
    @IBAction func MuseumClicked(_ sender: Any) {
        if (musOn == false){
           optionString = "Museums"
           turnOnPins(museumPins)
           leading.constant = -30
           trailing.constant = 0
           menuOut = false
           mus = true
           musOn = true
        } else {
            optionString = ""
            turnOffPins(museumPins)
            leading.constant = -30
            trailing.constant = 0
            menuOut = false
            mus = false
            musOn = false
        }
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

        //Possible function to make this all easier, need to test.
        
        func setPins(longitude: Double, latitude: Double, locationPin: CustomPointAnnotation, locationName: String, locationImage: String){
            let locationCoordinates = CLLocationCoordinate2DMake(longitude, latitude)
            locationPin.coordinate = locationCoordinates
            locationPin.title = locationName
            locationPin.imageName = locationImage
           
        }
        
        setPins(longitude: 34.241153, latitude: -118.528926, locationPin: jacarandaPin, locationName: "Jacaranda Hall", locationImage: "Jacaranda Hall.png")
       
        
        setPins(longitude: 34.240032, latitude: -118.529318, locationPin: libraryPin, locationName: "Oviatt Library", locationImage: "oviatt.png")
       
        
        setPins(longitude: 34.240479, latitude: -118.530862, locationPin: bayramianPin, locationName: "Bayramian Hall", locationImage: "bayramian.png")
        
        setPins(longitude: 34.238448, latitude: -118.528219, locationPin: liveOakPin, locationName: "Live Oak Hall", locationImage: "live oak.png")
        
        setPins(longitude: 34.240639, latitude: -118.528243, locationPin: sequoiaPin, locationName: "Sequia Hall", locationImage: "sequia.png")
        
        setPins(longitude: 34.23842, latitude: -118.527128, locationPin: chaparralPin, locationName: "Chaparral Hall", locationImage: "chaparall.png")
        
        setPins(longitude: 34.239096, latitude: -118.528073, locationPin: citrusPin, locationName: "Citrus Hall", locationImage: "citrus.png")
        
        setPins(longitude: 34.238730, latitude: -118.528118, locationPin: eucalyptusPin, locationName: "Eucalyptus Hall", locationImage: "Eucalyptus.png")
        
        setPins(longitude: 34.242014, latitude: -118.530814, locationPin: booksteinPin, locationName: "Bookstein Hall", locationImage: "bookstein.png")
        
        setPins(longitude: 34.23619, latitude: -118.529698, locationPin: cypressPin, locationName: "Cypress Hall", locationImage: "cypress.png")
        
        setPins(longitude: 34.236381, latitude: -118.530644, locationPin: nordhoffPin, locationName: "Nordhoff Hall", locationImage: "nordhoff.png")
        
        setPins(longitude: 34.242042, latitude: -118.526355, locationPin: redwoodPin, locationName: "Redwood Hall", locationImage: "redwood.png")
        
        setPins(longitude: 34.235926, latitude: -118.528006, locationPin: valleyPin, locationName: "Younes and Soraya Nazarian Center for the Performing Arts", locationImage: "valley.png")
        
        setPins(longitude: 34.242549, latitude: -118.528469, locationPin: sagebrushPin, locationName: "Sagebrush Hall", locationImage: "sagebrush.png")
        
        
        setPins(longitude: 34.238220, latitude: -118.530790, locationPin: sierraPin, locationName: "Sierra Hall", locationImage: "sierra.png")
        
        
        setPins(longitude: 34.239856, latitude: -118.524904, locationPin: srcPin, locationName: "Student Recreation Center", locationImage: "src.png")
        
        
        setPins(longitude: 34.240049, latitude: -118.525809, locationPin: usuPin, locationName: "University Student Union", locationImage: "usu.png")
        
        
        setPins(longitude: 34.2358, latitude: -118.5348, locationPin: wabaPin, locationName: "WaBa Grill", locationImage: "Jacaranda Hall.png")
        
        //        wabaPin.imageName = "*insert waba grill photo*"
        
        setPins(longitude: 34.2358, latitude: -118.5348, locationPin: ufcGymPin, locationName: "UFC GYM Northridge", locationImage: "Jacaranda Hall.png")
        
        setPins(longitude: 34.2374, latitude: -118.5079, locationPin: dearbparkPin, locationName: "Dearborn Park", locationImage: "Jacaranda Hall.png")
        
        
        setPins(longitude: 34.2412, latitude: -118.5579, locationPin: northridgePacificTheaterPin, locationName: "Northridge Pacific Theaters", locationImage: "Jacaranda Hall.png")
        
        setPins(longitude: 34.2355, latitude: -118.5443, locationPin: sanfernMuseumPin, locationName: "The Musuem of the San Fernando Valley", locationImage: "Jacaranda Hall.png")
        //mapView.addAnnotation(sanfernMuseumPin)
        
        setPins(longitude: 34.2295, latitude: -118.5671, locationPin: lilfreeLibraryPin, locationName: "Little Free Library", locationImage: "Jacarand Hall.png")
        
        
        setPins(longitude: 34.2246, latitude: -118.5234, locationPin: northridgemiddleSchoolPin, locationName: "Northirdge Middle School", locationImage: "Jacranda Hall.png")
        
        setPins(longitude: 34.2367, latitude: -118.5370, locationPin: northridgeunicenterPin, locationName: "Northridge University Center", locationImage: "Jacaranda Hall.png")
        
        
        setPins(longitude: 34.2399, latitude: -118.5264, locationPin: wellsfargoPin, locationName: "Wells Fargo Bank", locationImage: "Jacaranda Hall.png")
        //mapView.addAnnotation(wellsfargoPin)
        
        
        setPins(longitude: 34.2357, latitude: -118.5272, locationPin: gas76Pin, locationName: "76", locationImage: "Jacaranda Hall.png")
        
//        let jacarandaCoordinates = CLLocationCoordinate2DMake(34.241153, -118.528926)
//        jacarandaPin.coordinate = jacarandaCoordinates
//        jacarandaPin.title = "Jacaranda Hall"
//        jacarandaPin.imageName = "Jacaranda Hall.png"
        eduPins.append(jacarandaPin)
        //mapView.addAnnotation(jacarandaPin)
        
//        let libraryCoordinates = CLLocationCoordinate2DMake(34.240032, -118.529318)
//        libraryPin.coordinate = libraryCoordinates
//        libraryPin.title = "Oviatt Library"
//        libraryPin.imageName = "oviatt.png"
        eduPins.append(libraryPin)
        //mapView.addAnnotation(libraryPin)
        
//        let bayramianCoordinates = CLLocationCoordinate2DMake(34.240479, -118.530862)
//        bayramianPin.coordinate = bayramianCoordinates
//        bayramianPin.title = "Bayramian Hall"
//        bayramianPin.imageName = "bayramian.png"
        eduPins.append(bayramianPin)
        
        //mapView.addAnnotation(bayramianPin)
        
//        let liveOakCoordinates = CLLocationCoordinate2DMake(34.238448, -118.528219)
//        liveOakPin.coordinate = liveOakCoordinates
//        liveOakPin.title = "Live Oak Hall"
//        liveOakPin.imageName = "live oak.png"
        eduPins.append(liveOakPin)
        //mapView.addAnnotation(liveOakPin)
        
//        let sequoiaCoordinates = CLLocationCoordinate2DMake(34.240639, -118.528243)
//        sequoiaPin.coordinate = sequoiaCoordinates
//        sequoiaPin.title = "Sequoia Hall"
//        sequoiaPin.imageName = "sequoia.png"
        eduPins.append(sequoiaPin)
        //mapView.addAnnotation(sequoiaPin)
        
//        let chaparralCoordinates = CLLocationCoordinate2DMake(34.238342, -118.527128)
//        chaparralPin.coordinate = chaparralCoordinates
//        chaparralPin.title = "Chaparral Hall"
//        chaparralPin.imageName = "chaparall.png"
        eduPins.append(chaparralPin)
        //mapView.addAnnotation(chaparralPin)
        
//        let citrusCoordinates = CLLocationCoordinate2DMake(34.239096, -118.528073)
//        citrusPin.coordinate = citrusCoordinates
//        citrusPin.title = "Citrus Hall"
//        citrusPin.imageName = "citrus.png"
        eduPins.append(citrusPin)
        //mapView.addAnnotation(citrusPin)
        
//        let eucalyptusCoordinates = CLLocationCoordinate2DMake(34.238730, -118.528118)
//        eucalyptusPin.coordinate = eucalyptusCoordinates
//        eucalyptusPin.title = "Eucalyptus Hall"
//        eucalyptusPin.imageName = "Eucalyptus.png"
        eduPins.append(eucalyptusPin)
        //mapView.addAnnotation(eucalyptusPin)
        
//        let booksteinCoordinates = CLLocationCoordinate2DMake(34.242014, -118.530814)
//        booksteinPin.coordinate = booksteinCoordinates
//        booksteinPin.title = "Bookstein Hall"
//        booksteinPin.imageName = "bookstein.png"
        eduPins.append(booksteinPin)
        //mapView.addAnnotation(booksteinPin)
        
//        let cypressCoordinates = CLLocationCoordinate2DMake(34.236194, -118.529698)
//        cypressPin.coordinate = cypressCoordinates
//        cypressPin.title = "Cypress Hall"
//        cypressPin.imageName = "cypress.png"
        eduPins.append(cypressPin)
        //mapView.addAnnotation(cypressPin)
        
//        let nordhoffCoordinates = CLLocationCoordinate2DMake(34.236381, -118.530644)
//        nordhoffPin.coordinate = nordhoffCoordinates
//        nordhoffPin.title = "Nordhoff Hall"
//        nordhoffPin.imageName = "nordhoff.png"
        eduPins.append(nordhoffPin)
        //mapView.addAnnotation(nordhoffPin)
        
//        let redwoodCoordinates = CLLocationCoordinate2DMake(34.242042, -118.526355)
//        redwoodPin.coordinate = redwoodCoordinates
//        redwoodPin.title = "Redwood Hall"
//        redwoodPin.imageName = "redwood.png"
        eduPins.append(redwoodPin)
        
//        let valleyCoordinates = CLLocationCoordinate2DMake(34.235926, -118.528006)
//        valleyPin.coordinate = valleyCoordinates
//        valleyPin.title = "Younes and Soraya Nazarian Center for the Performing Arts"
//        valleyPin.imageName = "valley.png"
        eduPins.append(valleyPin)
        //mapView.addAnnotation(valleyPin)
        
//        let sagebrushCoordinates = CLLocationCoordinate2DMake(34.242549, -118.528469)
//        sagebrushPin.coordinate = sagebrushCoordinates
//        sagebrushPin.title = "Sagebrush Hall"
//        sagebrushPin.imageName = "sagebrush.png"
        eduPins.append(sagebrushPin)
        
//        let sierraCoordinates = CLLocationCoordinate2DMake(34.238220, -118.530780)
//        sierraPin.coordinate = sierraCoordinates
//        sierraPin.title = "Sierra Hall"
//        sierraPin.imageName = "sierra.png"
        eduPins.append(sierraPin)
        //mapView.addAnnotation(sierraPin)
        
//        let srcCoordinates = CLLocationCoordinate2DMake(34.239856, -118.524904)
//        srcPin.coordinate = srcCoordinates
//        srcPin.title = "Student Recreation Center"
//        srcPin.imageName = "src.png"
        eduPins.append(srcPin)
        //mapView.addAnnotation(srcPin)
        
//        let usuCoordinates = CLLocationCoordinate2DMake(34.240049, -118.525809)
//        usuPin.coordinate = usuCoordinates
//        usuPin.title = "Student Recreation Center"
//        usuPin.imageName = "usu.png"
        eduPins.append(usuPin)
        //mapView.addAnnotation(usuPin)
        //userLocation()
        
//       let wabaCoordinates = CLLocationCoordinate2DMake(34.2358, -118.5348)
//        wabaPin.coordinate = wabaCoordinates
//        wabaPin.title = "WaBa Grill"
//        wabaPin.imageName = "Jacaranda Hall.png"
        restaurantPins.append(wabaPin)
        //mapView.addAnnotation(wabaPin)
            
//        wabaPin.imageName = "*insert waba grill photo*"


//        let ufcGymCoordinates =
//            CLLocationCoordinate2DMake(34.2370, -118.5354)
//        ufcGymPin.coordinate = ufcGymCoordinates
//        ufcGymPin.title = "UFC GYM Northridge"
//        ufcGymPin.imageName = "Jacaranda Hall.png"
        //mapView.addAnnotation(ufcGymPin)
        
//        let dearbparkCoordinates =
//            CLLocationCoordinate2DMake(34.2374, -118.5079)
//        dearbparkPin.coordinate = dearbparkCoordinates
//        dearbparkPin.title = "Dearborn Park"
//        dearbparkPin.imageName = "Jacaranda Hall.png"
        parkPins.append(dearbparkPin)
        //mapView.addAnnotation(dearbparkPin)
        
//        let northridgePacificTheaterCoordinates =
//            CLLocationCoordinate2DMake(34.2412, -118.5579)
//        northridgePacificTheaterPin.coordinate = northridgePacificTheaterCoordinates
//        northridgePacificTheaterPin.title = "Northridge Pacific Theaters"
//        northridgePacificTheaterPin.imageName = "Jacaranda Hall.png"
        //mapView.addAnnotation(northridgePacificTheaterPin)
        
//        let sanfernMuseumCoordinates =
//            CLLocationCoordinate2DMake(34.2355, -118.5443)
//        sanfernMuseumPin.coordinate = sanfernMuseumCoordinates
//        sanfernMuseumPin.title = "The Musuem of the San Fernando Valley"
//        sanfernMuseumPin.imageName = "Jacaranda Hall.png"
        //mapView.addAnnotation(sanfernMuseumPin)
        
//        let lilfreeLibraryCoordinates =
//            CLLocationCoordinate2DMake(34.2295, -118.5671)
//        lilfreeLibraryPin.coordinate = lilfreeLibraryCoordinates
//        lilfreeLibraryPin.title = "Little Free Library"
//        lilfreeLibraryPin.imageName = "Jacaranda Hall.png"
        libraryPins.append(lilfreeLibraryPin)
        //mapView.addAnnotation(lilfreeLibraryPin)
        
//        let northridgemiddleschoolCoordinates =
//            CLLocationCoordinate2DMake(34.2246, -118.5234)
//        northridgemiddleSchoolPin.coordinate = northridgemiddleschoolCoordinates
//        northridgemiddleSchoolPin.title = "Northridge Middle School"
//        northridgemiddleSchoolPin.imageName = "Jacaranda Hall.png"
        schoolPins.append(northridgemiddleSchoolPin)
        //mapView.addAnnotation(northridgemiddleSchoolPin)
        
//        let northridgeunicenterCoordinates =
//            CLLocationCoordinate2DMake(34.2367, -118.5370)
//        northridgeunicenterPin.coordinate = northridgeunicenterCoordinates
//        northridgeunicenterPin.title = "Northridge University Center"
//        northridgeunicenterPin.imageName = "Jacaranda Hall.png"
//        //mapView.addAnnotation(northridgeunicenterPin)
//
//        let wellsfargoCoordinates =
//            CLLocationCoordinate2DMake(34.2399, -118.5264)
//        wellsfargoPin.coordinate = wellsfargoCoordinates
//        wellsfargoPin.title = "Wells Fargo Bank"
//        wellsfargoPin.imageName = "Jacaranda Hall.png"
//        //mapView.addAnnotation(wellsfargoPin)
//
//        let gas76Coordinates =
//            CLLocationCoordinate2DMake(34.2357, -118.5272)
//        gas76Pin.coordinate = gas76Coordinates
//        gas76Pin.title = "76"
//        gas76Pin.imageName = "Jacaranda Hall.png"
        gasPins.append(gas76Pin)
        //mapView.addAnnotation(gas76Pin)
        
        
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

