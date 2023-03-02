//
//  OpeningScreen.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 3/1/23.
//

import SwiftUI

struct OpeningScreen: View {
    @State var goNextTapped: Bool = false
    private let localVideoName = "backgroundLoop"
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                BgdFullScreenVideoView(videoName: localVideoName)
                    .overlay(Color.white.opacity(0.2))
                
                makeNavigationLink()
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            goNextTapped = true
                        } label: {
                            Text("NEXT")
                                .fontWeight(.bold)
                                .padding()
                                .foregroundColor(Color.black)
                        }
                        .background(Color.blue)
                        .cornerRadius(8)
                        .padding()
                                                
                        Spacer()
                    }
                }
            }
        }
    }
    
    private func makeNavigationLink() -> some View {
        NavigationLink(
            destination: ChapterList().environmentObject(ModelData()),
            isActive: $goNextTapped,
            label: { EmptyView() }
        )
    }
}

struct OpeningScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpeningScreen()
    }
}
