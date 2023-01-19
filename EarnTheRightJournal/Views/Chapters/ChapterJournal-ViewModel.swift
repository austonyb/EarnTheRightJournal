//
//  ChapterJournal-ViewModel.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/18/23.
//

import Foundation

extension ChapterJournal {
    @MainActor class ViewModel: ObservableObject {
        @Published var journalEntries: [JournalEntry] = []
        @Published var journalEntry: String = ""
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("JournalEntries")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                journalEntries = try JSONDecoder().decode([JournalEntry].self, from: data)
            } catch {
                journalEntries = []
            }
        }
    }
}
