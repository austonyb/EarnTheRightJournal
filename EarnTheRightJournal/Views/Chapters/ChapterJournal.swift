//
//  ChapterJournal.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/17/23.
//

import SwiftUI

struct ChapterJournal: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var journal: String
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $journal)
                .padding(.horizontal)
                .navigationTitle("Journal Entry")
                .onTapGesture {}
        }
    }
}

struct ChapterJournal_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        
        ChapterJournal(journal: .constant("lorem ipsum"))
            .environmentObject(modelData)
    }
}
