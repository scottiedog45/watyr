//
//  SingleEvent.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct SingleEvent: View {
	
	@Binding var event : Event
	
	var body: some View {
		
		ZStack {
			
			Color.black
			
			ScrollView(.vertical, showsIndicators: true) {
				
				VStack(alignment: .leading, spacing: 10) {
					
					VStack {
						
						ZStack {
							
							if (event.name == "yoga") {
								
								Image(uiImage: UIImage(named: "yoga")!)
									.resizable()
									.aspectRatio(contentMode: .fit)
								
							} else if (event.name == "concert" ){
								Image(uiImage: UIImage(named: "concert")!)
									.resizable()
									.aspectRatio(contentMode: .fill)
								
							} else if (event.name == "lunch" ){
								Image(uiImage: UIImage(named: "lunch")!)
									.resizable()
									.aspectRatio(contentMode: .fit)
									.frame(width: UIScreen.main.bounds.width)
								
							}
							else {
								Image(uiImage: UIImage(named: "wine")!)
									.resizable()
									.aspectRatio(contentMode: .fill)
									//this offset fixes some wierd layout bug with a wipe stripe showing up on the edge of the header picture
									.offset(x: -1)
								
							}
						}
						HStack {
							
							VStack {
								
								Text(event.name)
									.font(.largeTitle)
								
								Text(event.location)
								
								Text(event.time)
								
								HStack {
									
									FilledStar()
									FilledStar()
									FilledStar()
									HalfStar()
									EmptyStar()
								}
								Text("rating")
									.font(.caption)
							}
							.padding()
						}
						
						Button(event.attending ? "CANCEL RESERVATION" : "PURCHASE") {
							self.event.attending.toggle()
							print(self.event.attending)
						}
						.padding()
						.overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 2))
						
						
						Text(event.description)
							.lineLimit(nil)
							.multilineTextAlignment(.leading)
							.padding()
					}
				}
			}
		}
		.foregroundColor(.white)
		.edgesIgnoringSafeArea([.top, .bottom])
	}
}

struct FilledStar : View {
	var body : some View {
		Image(systemName: "star.fill")
			.resizable()
			.frame(width: 30, height: 30)
	}
}

struct EmptyStar : View {
	var body : some View {
		Image(systemName: "star")
			.resizable()
			.frame(width: 30, height: 30)
	}
}

struct HalfStar : View {
	var body : some View {
		Image(systemName: "star.lefthalf.fill")
			.resizable()
			.frame(width: 30, height: 30)
	}
}

#if DEBUG
struct SingleEvent_Previews: PreviewProvider {
	static var previews: some View {
		Group{
			SingleEvent(event: .constant(mockEvents[0]))
			SingleEvent(event: .constant(mockEvents[1]))
			SingleEvent(event: .constant(mockEvents[2]))
			SingleEvent(event: .constant(mockEvents[4]))
			
		}
	}
}
#endif
