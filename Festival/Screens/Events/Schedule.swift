//
//  Schedule.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI


struct APicker : View {
	
	@Binding var selectedIndex : Int
	
	@State private var numbers = ["attending", "not attending", "all"]
	
	var body : some View {
		
		VStack {
			
			Text("filter your events")
				.foregroundColor(Color.white)
				.font(.system(size: 20))
				.bold()
			.padding([.top], 60)
				
			Picker("Filter List", selection: $selectedIndex) {
				
				ForEach(0 ..< numbers.count) { index in
					
					Text(self.numbers[index]).tag(index)
						.onTapGesture {
							print(self.$selectedIndex)
					}
				}
			}
			.pickerStyle(SegmentedPickerStyle())
			.background(Color.white.opacity(0.5).cornerRadius(9))
		}
	}
}

struct Schedule: View {
	
	@ObservedObject var state = EventState()
	
	@State private var selectedIndex : Int = 0
	
	var width = UIScreen.main.bounds.width
	
    var body: some View {
		
		ZStack {
			
			Color.blue.opacity(0.6)
			
			VStack {
				
				APicker(selectedIndex: $selectedIndex)
					.padding()
					.frame(width: UIScreen.main.bounds.width, alignment: .leading)
				
				ListThing(list: self.state.list, selected: selectedIndex)
					.padding([.top], -10)
			}
			.navigationBarHidden(true)
			.navigationBarBackButtonHidden(true)
		}
		.edgesIgnoringSafeArea(.all)
	}
}

struct ListThing : View {
	
	@State var list : [Event]
	
	@State var isPresented : Bool = false
	
	@State var id : String = "what"
	
	var selected : Int
	
	var body : some View {
		
		ScrollView(.vertical, showsIndicators: true) {
			
			ForEach((self.selected > 0 ?
				(self.selected > 1 ? self.list : self.list.filter {!$0.attending}) : self.list.filter {$0.attending})) {event in
				EventRow(event: event)
					.onTapGesture {
						self.id = event.id
						self.isPresented.toggle()
				}
				.frame(width : UIScreen.main.bounds.width - 32)
				.animation(Animation.easeInOut(duration: 0.5))
					.cornerRadius(10)
					
					
					
			}
		}.sheet(isPresented: $isPresented, onDismiss: {self.isPresented = false}) {
			SingleEvent(event: self.$list.first { $0.id == self.id } ?? self.$list[0])
		}
	.padding()
	}
}


#if DEBUG
struct Schedule_Previews: PreviewProvider {
    static var previews: some View {
		Schedule()
    }
}
#endif
