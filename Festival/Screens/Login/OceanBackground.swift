//
//  OceanBackground.swift
//  Festival
//
//  Created by Scott OToole on 7/27/19.
//  Copyright © 2019 Scott OToole. All rights reserved.
//

import Foundation
import SwiftUI
import AVFoundation
import AVKit
import UIKit

struct OceanBackgroundWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = OceanBackground


    func makeUIViewController(context: UIViewControllerRepresentableContext<OceanBackgroundWrapper>) -> OceanBackgroundWrapper.UIViewControllerType {
        return OceanBackground()
    }

    func updateUIViewController(_ uiViewController: OceanBackgroundWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<OceanBackgroundWrapper>) {
        //
    }
}

class OceanBackground : UIViewController {
	
	var player: AVPlayer?
	 
	
	override func viewDidLoad() {
		super.viewDidLoad()
		playBackgoundVideo()
	}
	

		private func playBackgoundVideo() {
			//get local file
			if let filePath = Bundle.main.path(forResource: "water", ofType:"mp4") {
				let filePathUrl = NSURL.fileURL(withPath: filePath)
				
				//setup player
				player = AVPlayer(url: filePathUrl)
				let playerLayer = AVPlayerLayer(player: player)
				
				//setup frame and resizing
				playerLayer.frame = self.view.bounds
				playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
			
				//put it on a loop
				NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem, queue: nil) { (_) in
					self.player?.seek(to: CMTime.zero)
					self.player?.play()
				}
				
				//add layer
				self.view.layer.addSublayer(playerLayer)
				
				//play
				player?.play()
			}
		}
}
