//
//  ChapterList.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/17/23.
//

import SwiftUI

struct ChapterList: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(chapters) { chapter in
                    NavigationLink {
                        ChapterDetail(chapter: chapter)
                    } label: {
                        ChapterRow(chapter: chapter)
                    }
                    
                }
                .navigationTitle("Chapters")
            }
        }
    }
}

struct ChapterList_Previews: PreviewProvider {
    static var previews: some View {
        ChapterList()
            .environmentObject(ModelData())
    }
}
