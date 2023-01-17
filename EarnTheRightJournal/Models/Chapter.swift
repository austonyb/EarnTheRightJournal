//
//  Chapter.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/17/23.
//

import Foundation

struct Chapter: Hashable, Codable, Identifiable {
    var id: Int
    var header: String
    var callouts: [String]
    var journal: String
}
