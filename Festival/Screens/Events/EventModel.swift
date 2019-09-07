//
//  EventModel.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI


struct Event : Identifiable {
	var name : String
	var id : String
	var location : String
	var time : String
	var image : String
	var attending : Bool
	var description : String
	
	mutating func updateAttendance() {
		self.attending.toggle()
	}
//	
	init(name: String, id: String, location : String, time: String, image: String, attending: Bool, description: String) {
		self.name = name
		self.id = id
		self.location = location
		self.time = time
		self.image = image
		self.attending = attending
		self.description = description
	}
//	let shouldShowPurchaseButton : Bool
}
