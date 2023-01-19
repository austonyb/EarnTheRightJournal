//
//  FileManager-DocumentsDirectory.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/18/23.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
