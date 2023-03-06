//
//  About.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 3/4/23.
//

import SwiftUI

struct About: View {
    
    var body: some View {
        VStack {
            Spacer()
            Image("bookCover")
                .resizable()
                .scaledToFit()
                    .frame(width: 400.0)
                .padding()
            Text("This app is a companion piece to the book, \"Earn the Right,\" by Patrick Youngblood. The Book can be purchased on Amazon.")
                .padding()
            Link("Find the book on Amazon", destination: URL(string: "https://www.amazon.com/Earn-Right-Survival-Relationship-Building-ebook/dp/B09DSPWKLW/")!)
                .padding()
            Spacer()

            Text("App ©2023 by Auston Youngblood")
            Link("austonyoungblood.com", destination: URL(string: "https://austonyoungblood.com")!)
                .padding(4)
            Spacer()
        }
    }
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
