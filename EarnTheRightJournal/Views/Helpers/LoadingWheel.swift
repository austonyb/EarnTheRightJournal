//
//  LoadingWheel.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/19/23.
//

import SwiftUI

struct LoadingWheel: View {
    @State private var rotation: Double = 0

    var body: some View {
        VStack {
            Spacer()
            Image("loading")
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.rotation = 360
                }
            Spacer()
        }
    }
}

struct LoadingWheel_Previews: PreviewProvider {
    static var previews: some View {
        LoadingWheel()
    }
}
