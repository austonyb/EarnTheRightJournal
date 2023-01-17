//
//  JournalEntry.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/17/23.
//

import SwiftUI

struct JournalEntry: View {
    @Binding var journal: String
    
    var body: some View {
        TextField(journal, text: $journal)
            .textFieldStyle(RoundedBorderTextFieldStyle())
    }
}

struct JournalEntry_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntry(journal: .constant("lorem ipsum"))
    }
}
