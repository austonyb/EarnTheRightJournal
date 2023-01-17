//
//  ChapterDetail.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/17/23.
//

import SwiftUI

struct ChapterDetail: View {
    @EnvironmentObject var modelData: ModelData
    var chapter: Chapter
    
    var chapterIndex: Int {
        modelData.chapters.firstIndex(where: { $0.id == chapter.id})!
    }
    
    
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .center) {
                Drop()
                Text("Chapter \(chapter.id)")
                    .font(.largeTitle)
                    .padding()
                
                Text("Callouts:")
                    .font(.title2)

                    
                VStack(alignment: .leading, spacing: 12){
                    ForEach(chapter.callouts, id: \.self) { callout in
                        Text(callout)
                    }
                }
                .padding()
                
            }
            VStack (alignment: .leading) {
                JournalEntry(journal: $modelData.chapters[chapterIndex].journal)
            }
            .padding()
            .background(Color.accentColor)
        }
        
    }
}

struct ChapterDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ChapterDetail(chapter: modelData.chapters[0])
            .environmentObject(modelData)
    }
}
