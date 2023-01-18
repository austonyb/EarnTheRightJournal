//
//  ContentView.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/16/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ChapterList()
                .environmentObject(ModelData())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
