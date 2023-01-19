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
    
    @StateObject private var viewModel = ViewModel()
    
    var chapterIndex: Int {
        modelData.chapters.firstIndex(where: { $0.id == chapter.id})!
    }
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                VStack() {
                    Drop()
                    
                    Text("Chapter \(chapter.id)")
                        .font(.largeTitle)
                        .padding()
                    Text(chapter.header.uppercased())
                        .font(.title3)
                        .padding()
                    
                    VStack(alignment: .leading, spacing: 12){
                        Text("Callouts:")
                            .font(.title2)
                        
                        ForEach(chapter.callouts, id: \.self) { callout in
                            Text("• \(callout)")
                        }
                    }
                    .padding()
                    
                }
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button {
                            viewModel.save()
                            let _ = print("save button was tapped")
                        } label: {
                            Text("Save")
                        }
                        
                    }
                }
                
                VStack (alignment: .leading) {
                    Text("Journal:")
                        .font(.title3)
                    TextField("Enter your journal here", text: $viewModel.journalEntries[chapterIndex].entry)
                    
                }
                .padding()
                
            }
        }
        
    }
}



//MARK: - Preview Code
struct ChapterDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ChapterDetail(chapter: modelData.chapters[0])
            .environmentObject(modelData)
    }
}

