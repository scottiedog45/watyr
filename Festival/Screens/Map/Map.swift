//
//  Map.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI
import MapKit

struct Map: View {
	@State var c : CLLocationCoordinate2D =  CLLocationCoordinate2D(
					latitude: 21.283921, longitude: -157.831661)
    
	@State var tapped : Bool = false
	
	var body: some View {
		ZStack {
			
			MapView(center : $c)
				.frame(width: UIScreen.main.bounds.width, height: 1000, alignment: .center)
			
			VStack {
				
				Spacer()
					.frame(height: 650)
				
				ScrollView(.vertical, showsIndicators: true) {
					
					Text("scroll/tap venue name below to focus map")
					.padding()
					.background(Color.white.opacity(0.7))
					.cornerRadius(20)
					
					ForEach(festivalLocations) {location in
						
						VStack {
							
							MapViewEntry(location: location)
								.onTapGesture {
									self.tapped.toggle()
									self.c = location.coordinate
							}
						}
					}
				}.frame(height: 230)
			}.padding(.bottom, 80)
		}
		.frame(height: UIScreen.main.bounds.height + 100)
		.edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct Map_Previews: PreviewProvider {
    static var previews: some View {
        Map()
    }
}
#endif
