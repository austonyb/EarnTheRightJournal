//
//  JournalStorage.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/18/23.
//

import Foundation

class JournalEntryController {
    
    //shared instance
    static let shared = JournalEntryController()
    
    //Source of Truth
    var journalEntries: [JournalEntry] = []
    
    //MARK: - CRUD
    
    func addJournalEntry(id: Int, journal: String) {
        //declare a new journal entry object
        let newJournalEntry = JournalEntry(id: id, journal: journal)
        
        //add the new journal entry to the source of truth array on line 16:
        journalEntries.append(newJournalEntry)
        
        //save
        saveToPersistentStore()
    }
    
    func deleteJournalEntry(journalEntry: JournalEntry, newText: String) {
        //find the index of the journal entry
        guard let index = journalEntries.firstIndex(of: journalEntry) else { return }
        
        //remove journal entry from SOT
        journalEntries.remove(at: index)
        
        saveToPersistentStore()
    }
    
    
    //MARK: - PersistentStore
    func createPersistentStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in:
                .userDomainMask)
        let fileURL = url[0].appendingPathComponent("journalEntries.json")
        return fileURL
    }
    
    //Save
    func saveToPersistentStore() {
        do {
            let data = try JSONEncoder().encode(journalEntries)
            try data.write(to: createPersistentStore())
        } catch {
            print("Error encoding journal entries to persistent store: \(error) -- \(error.localizedDescription)")
        }
    }
    
    //Load
    func loadFromPersistentStore() {
        do {
            let data = try Data(contentsOf: createPersistentStore())
            journalEntries = try JSONDecoder().decode([JournalEntry].self, from: data)
        } catch {
            print("Error decoding json data into journal entries: \(error) -- \(error.localizedDescription)")
        }
    }
    
    //return journal entry based on chapter id
    func returnJournalEntry(chapterIndex: Int) -> JournalEntry {
        guard let chapterEntry = journalEntries.first(where:{$0.id == chapterIndex}) else {
            return JournalEntry(id: 99, journal: "")
        }
        return chapterEntry
    }
    
    

}
