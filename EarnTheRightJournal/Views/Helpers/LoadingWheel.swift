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
            Image("loadingBlue")
                .overlay {
                    Circle().stroke(.blue, lineWidth: 10)
                }
                .shadow(radius: 7)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: true))
                .onAppear() {
                    self.rotation = 720
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
