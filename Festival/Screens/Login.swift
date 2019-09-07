//
//  Login.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI
import AVFoundation
import AVKit

struct Login: View {
	
	@Binding var showing : Bool
	
	@State var loginEmail : String = ""
	
	@State var password : String = ""
	
	@State var moving : Bool = false
	
	@State var animatingGrading : Bool = false
	
	var body: some View {
		
		//video background alternating between water and some concert
		//logo
		NavigationView {
			
			ZStack {
				//other potential backgrounds
				//		OceanBackgroundWrapper()
				//				LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
				ZStack {
					Color.blue.opacity(animatingGrading ? 0.8 : 0)
					.animation(Animation.easeInOut(duration: 4.0).repeatForever(autoreverses: true))
						
					Color.blue.opacity(0.6)
				}
				.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
				.edgesIgnoringSafeArea(.all)
				
				VStack {
					
					VStack(spacing: 30) {
						
						VStack {
							
							Text("watyr")
								.font(.largeTitle)
							
							Text("music festival")
								.font(.subheadline)
						}
						
						Image(uiImage: UIImage(named: "music")!)
							.resizable()
							.aspectRatio(contentMode: .fit)
						
						VStack(alignment: .leading, spacing: 5) {
							Text("email")
							TextField("", text: $loginEmail)
								.textFieldStyle(RoundedBorderTextFieldStyle())
						}
						
						VStack(alignment: .leading, spacing: 5) {
							Text("password")
							TextField("", text: $password)
								.textFieldStyle(RoundedBorderTextFieldStyle())
						}
						
						Button(action: {
							self.showing.toggle()
						}, label: {
							Text("enter")
								.frame(width: 300, height: 50)
						})
							.overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 3))
						
						Button("forgot password") {
							print("")
						}
						
						Spacer()
					}
					.frame(width: 300, height: 700, alignment: .center)
					.foregroundColor(.white)
					.onAppear {
						self.moving.toggle()
						
					}
					Spacer()
				}
			}.onAppear {
				self.animatingGrading.toggle()
			}
		}
	}
}

#if DEBUG
struct Login_Previews: PreviewProvider {
	
	@State var b : Bool = true
	
	static var previews: some View {
		Login(showing: .constant(true))
	}
}
#endif
