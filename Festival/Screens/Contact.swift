//
//  Contact.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct Contact: View {
	
	@State var message : String
	
	@State var visible : Bool = false
	
	@State var showingAlert : Bool = false
	
	
	
	var iconSize : CGFloat = 80
	
	var body: some View {
		
		ZStack {
			
			ZStack {
				
					Color.blue.opacity(0.6)
				
					//magic combo for getting background to extend the height of the screen
					.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
					.edgesIgnoringSafeArea(.all)
					
			}
			
			HStack(alignment: .top) {
			
			VStack(spacing: 20) {
				
				Text("What's up?")
					.font(.largeTitle)
				
				Image(uiImage: UIImage(named: "contact")!)
					.resizable()
					.aspectRatio(contentMode: .fit)
				
				Text("Please let us know if there's anything we can do to improve your watyr experience.")
					.multilineTextAlignment(.center)
					.lineLimit(nil)
					.frame(width: 350, height: 60, alignment: .center)
				
				HStack(spacing: 50) {
					
					VStack {
						
						Text("Chat")
						
						Image(systemName: "bubble.left.fill")
							.resizable()
							.onTapGesture {
								self.visible.toggle()
						}
						.frame(width: iconSize, height: iconSize, alignment: .center)
					}
					
					VStack {
						
						Text("Call")
						
						Image(systemName: "phone.circle.fill")
							.resizable()
							.frame(width: iconSize, height: iconSize, alignment: .center)
							.onTapGesture {
								if let url = URL(string: "tel://555-555-5555"), UIApplication.shared.canOpenURL(url) {
									UIApplication.shared.open(url)
								}
						}
					}
				}
				Spacer()
					.frame(height: 100)
			}
			.foregroundColor(.white)
			.animation(.default)
			}
		}
	}
}

#if DEBUG
struct Contact_Previews: PreviewProvider {
	static var previews: some View {
		Contact(message: "hi")
	}
}
#endif
