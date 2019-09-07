//
//  EventsState.swift
//  Festival
//
//  Created by Scott OToole on 7/28/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class EventState : ObservableObject {
	
	@Published
	var list : [Event] = mockEvents
	
	var single : Event = mockEvents[0]
	
}
