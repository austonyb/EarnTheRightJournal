//
//  ChapterDetail-ViewModel.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/18/23.
//

import Foundation

extension ChapterDetail {
    @MainActor class ViewModel: ObservableObject {
        @Published var  journalEntries: [JournalEntry]
        
        //save path for journal entries json file
        let savePath = FileManager.documentsDirectory.appendingPathComponent("journalEntries.json")
        
        //initializer. if there is no data in the json file it will initialize the journal entries array as empty.
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                journalEntries = try JSONDecoder().decode([JournalEntry].self, from: data)
            } catch {
                print("Error decoding json data into journal entries: \(error) -- \(error.localizedDescription)")
                
                journalEntries = [
                    JournalEntry(id: 1, entry: "lkjlkjlkjlj"),
                    JournalEntry(id: 2, entry: ""),
                    JournalEntry(id: 3, entry: ""),
                    JournalEntry(id: 4, entry: ""),
                    JournalEntry(id: 5, entry: ""),
                    JournalEntry(id: 6, entry: ""),
                    JournalEntry(id: 7, entry: ""),
                    JournalEntry(id: 8, entry: ""),
                    JournalEntry(id: 9, entry: ""),
                    JournalEntry(id: 10, entry: ""),
                    JournalEntry(id: 11, entry: ""),
                    JournalEntry(id: 12, entry: ""),
                    JournalEntry(id: 13, entry: ""),
                    JournalEntry(id: 14, entry: ""),
                    JournalEntry(id: 15, entry: ""),
                    JournalEntry(id: 16, entry: ""),
                    JournalEntry(id: 17, entry: ""),
                    JournalEntry(id: 18, entry: ""),
                    JournalEntry(id: 19, entry: ""),
                    JournalEntry(id: 20, entry: ""),
                    JournalEntry(id: 21, entry: ""),
                    JournalEntry(id: 22, entry: ""),
                    JournalEntry(id: 23, entry: ""),
                    JournalEntry(id: 24, entry: ""),
                    JournalEntry(id: 25, entry: ""),
                    JournalEntry(id: 26, entry: ""),
                    JournalEntry(id: 27, entry: ""),
                    JournalEntry(id: 28, entry: ""),
                    JournalEntry(id: 29, entry: ""),
                    JournalEntry(id: 30, entry: ""),
                ]
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(journalEntries)
                try data.write(to: savePath)
            } catch {
                print("Unable to save data.")
            }
        }
        
        
    }
}
