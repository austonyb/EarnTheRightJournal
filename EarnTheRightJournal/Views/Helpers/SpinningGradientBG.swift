//
//  SpinningGradientBG.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 3/1/23.
//

import SwiftUI

struct SpinningGradientBG: View {
    @State private var isRotating = 0.0
    var body: some View {
        Circle()
            .fill(
                AngularGradient(gradient: Gradient(colors: [.white, .accentColor]), center: .center)
            )
            .frame(width: 2000, height: 2000)
            .ignoresSafeArea()
            .rotationEffect(.degrees(isRotating))
            .onAppear {
                withAnimation(.linear(duration: 8)
                    .speed(0.1).repeatForever(autoreverses: false)) {
                        isRotating = 360.0
                    }
            }
            .offset(x: -300, y: -300)
    }
}

struct SpinningGradientBG_Previews: PreviewProvider {
    static var previews: some View {
        SpinningGradientBG()
    }
}
