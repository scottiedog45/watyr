//
//  ContentView.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
	
	@State var showingLogin = true
 
    var body: some View {
//		NavigationView {
		ZStack {
			Login(showing: $showingLogin)
				.zIndex(1)
				.opacity(showingLogin ? 1 : 0)
				.animation(.default)
//			NavigationView {
        TabView(selection: $selection){
            
            Map()
				
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Map")
                    }
                }
                .tag(0)
			Schedule()
				
				.tabItem {
					VStack {
						Image(systemName: "doc.text")
						Text("Events")
					}
				}
				.tag(1)
			Contact(message : "hi")
							.tabItem {
								VStack {
									Image(systemName: "bubble.left")
									Text("Contact")
								}
							}
							.tag(2)
				}
//        }
			
		//what's the difference between color and ui color
			
		.foregroundColor(Color.black) //changes text color
		.accentColor(Color.blue) //changes tab color
//		.navigationBarBackButtonHidden(true)
			.navigationBarItems(trailing: Button("logout", action: {
				self.showingLogin.toggle()
			}))
		.edgesIgnoringSafeArea(
			self.selection == 0 ? .top :
				self.selection == 1 ? .top : .top)
		
		
		
		}
			
//		.navigationBarHidden(true)
		
    }
//		.edgesIgnoringSafeArea(.top)
//	}
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
