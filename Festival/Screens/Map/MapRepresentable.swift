//
//  MapRepresentable.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

//struct TestMapViewWrapper : View {
////	var center : CLLocationCoordinate2D
//	@State var c : CLLocationCoordinate2D  = CLLocationCoordinate2D(
//					latitude: 21.283921, longitude: -157.831661)
//
//	init(_ center: CLLocationCoordinate2D) {
//		self.c = center
//	}
//
//	var body: some View {
//		MapView(center: $c)
//	}
//}

struct MapView: UIViewRepresentable {
	
	func makeCoordinator() -> MapView.Coordinator {
		Coordinator(self)
	}
	
	
	
	@Binding var center : CLLocationCoordinate2D
	
    func makeUIView(context: Context) -> MKMapView {
			MKMapView(frame: .zero)
		}
	
	func updateUIView(_ view: MKMapView, context: Context) {
			let coordinate = CLLocationCoordinate2D(
				latitude: 21.283921, longitude: -157.831661)
			let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
			let region = MKCoordinateRegion(center: center, span: span)
		
			view.setRegion(region, animated: true)
			view.addAnnotations(festivalLocations)
		}
	
	
	
	class Coordinator: NSObject {
			var parent: MapView

			init(_ mapView: MapView) {
				self.parent = mapView
			}
		
		func updateMap() {
			
			}
		}

	
}

//struct MapView_Preview: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
