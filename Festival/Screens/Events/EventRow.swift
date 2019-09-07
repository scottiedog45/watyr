//
//  EventRow.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct HeroImage : View {
	
	var event: Event
	
	var body : some View {
		ZStack {
		if (event.name == "yoga") {
		
			Image(uiImage: UIImage(named: "yoga")!)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.offset(x:10, y: 0)
				
		} else if (event.name == "concert" ){
			Image(uiImage: UIImage(named: "concert")!)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.offset(x: 10, y: 0)
			} else if (event.name == "lunch" ){
				Image(uiImage: UIImage(named: "lunch")!)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.offset(x: 20, y: 0)
				}
		else {
			Image(uiImage: UIImage(named: "wine")!)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.offset(x: 20, y: 0)
			}
		}
	}
}



struct EventRow : View {
	
	var event : Event
	
	var width = UIScreen.main.bounds.width - 32
	
	var body : some View {
		VStack {
										
//			VStack {
				EventInfo(event: event)
//				}
				.padding()
				.background(Color.black.opacity(0.5))
				.cornerRadius(10)
				
			
			}
			.frame(width: width, height: 340)
			.background(
				ZStack {
					ZStack {
					HeroImage(event: event)
						Color.black.opacity(0.1).blendMode(.multiply)
					}
					VStack {
					Spacer()
					Text("tap for info")
						.font(.headline)
						.bold()
						.padding()
					}
				}
			).foregroundColor(.white)
		.navigationBarBackButtonHidden(true)
	}
}

#if DEBUG
struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
		Group{
			EventRow(event: mockEvents[1])
		}
		.previewLayout(.fixed(width: 400, height: 340))
    }
}
#endif

struct EventInfo: View {

	var event : Event
	
    var body: some View {
        VStack(alignment: .leading) {
	
			if (event.attending) {
			Text("ATTENDING")
				.underline()
				.animation(.default)
			}
			
            Text(event.name)
                .font(.title)
                .bold()
                
			Text(event.location)
				.font(.subheadline)
				
			Text(event.time)
				.font(.subheadline)
		}
	}
}
