//
//  PlayerView.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 3/1/23.
//

import SwiftUI
import AVFoundation

struct PlayerView: UIViewRepresentable {
    private let videoName: String
    private let player: AVQueuePlayer
    
    init(videoName: String, player: AVQueuePlayer) {
        self.videoName = videoName
        self.player = player
    }
    
    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<PlayerView>) { }

    func makeUIView(context: Context) -> UIView {
        return LoopingPlayerUIView(videoName: videoName, player: player)
    }
}
