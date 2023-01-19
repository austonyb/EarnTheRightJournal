//
//  Drop.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/17/23.
//

import SwiftUI

struct Drop: View {
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            Image("loadingBlue")
                .resizable()
                .frame(width: 250, height: 250)
                .shadow(radius: 10)
                .rotationEffect(.degrees(rotation))
                .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false))
                .onAppear() {
                    self.rotation = 360
                }
                .opacity(0.2)
            
            Image("drop")
                .resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.cyan, lineWidth: 4)
                }
            .shadow(radius: 7)
        }
            
    }
}

struct Drop_Previews: PreviewProvider {
    static var previews: some View {
        Drop()
    }
}
