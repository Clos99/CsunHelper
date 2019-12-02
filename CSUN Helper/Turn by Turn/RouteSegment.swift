//
//  RouteSegment.swift
//  AugmentedReality
//
//  Created by Bibinur on 11/9/19.
//  Copyright © 2019 Bibinur. All rights reserved.
//

import CoreLocation

struct RouteSegment {
    var startLatitude: CLLocationDegrees
    var startLongitude: CLLocationDegrees
    var startAltitude: CLLocationDistance
    
    var endLatitude: CLLocationDegrees
    var endLongitude: CLLocationDegrees
    var endAltitude: CLLocationDistance
    
}
