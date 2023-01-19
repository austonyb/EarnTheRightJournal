//
//  ChapterRow.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/17/23.
//

import SwiftUI

struct ChapterRow: View {
    
    var chapter: Chapter
    
    var body: some View {
        HStack {
            Text("Chapter \(chapter.id)")
                .fontDesign(.rounded)
        
            Spacer()
            
            Text(chapter.header.lowercased())
                .lineLimit(1)
        }
        .padding()
    }
}

struct ChapterRow_Previews: PreviewProvider {
    static var chapters = ModelData().chapters
    static var previews: some View {
        ChapterRow(chapter: chapters[0])
    }
}
