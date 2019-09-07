//
//  LocationData.swift
//  Festival
//
//  Created by Scott OToole on 7/28/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit
import SwiftUI

class FestivalLocation: NSObject, MKAnnotation, Identifiable {
  let id : String
  let title: String?
  let locationName: String
  let coordinate: CLLocationCoordinate2D
  
	init(id: String, title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
    self.title = title
		self.id = id
    self.locationName = locationName
    self.coordinate = coordinate
    
    super.init()
  }
  
  var subtitle: String? {
    return locationName
  }
}

var festivalLocations : [FestivalLocation] = [
	FestivalLocation(id: "1", title: "Concert Venue", locationName: "Another Place", coordinate: CLLocationCoordinate2DMake(21.353921, -157.841661)),
	FestivalLocation(id: "2", title: "Hickory Cellar", locationName: "Hills", coordinate: CLLocationCoordinate2DMake(21.393921, -157.851661)),
	FestivalLocation(id: "3", title: "West Studio", locationName: "Ocean", coordinate: CLLocationCoordinate2DMake(21.403921, -157.871661)),
	FestivalLocation(id: "4", title: "Main Hall", locationName: "Amphitheater", coordinate: CLLocationCoordinate2DMake(21.413921, -157.911661))
]
