//
//  MapViewEntry.swift
//  Festival
//
//  Created by Scott OToole on 7/28/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct MapViewEntry: View {
	
	var location : FestivalLocation
	
    var body: some View {
		VStack(alignment: .leading) {
			HStack {
				VStack(alignment: .leading) {
					Text("\(location.title!)")
						.font(.title)
					.bold()
					Text("\(location.locationName)")
						.font(.subheadline)
				}
				.layoutPriority(5)
				Spacer()
				.layoutPriority(1)
			}
		}.padding()
		.frame(width: UIScreen.main.bounds.width - 32)
		.background(Color.white.opacity(0.7))
		.cornerRadius(20)
    }
}

#if DEBUG
struct MapViewEntry_Previews: PreviewProvider {
    static var previews: some View {
		MapViewEntry(location: festivalLocations[0])
			.previewLayout(.fixed(width: 400, height: 300))
    }
}
#endif
