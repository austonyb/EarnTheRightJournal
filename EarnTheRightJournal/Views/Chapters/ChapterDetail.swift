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
                    
                    Text("Callouts:")
                        .font(.title2)
                    
                    
                    VStack(alignment: .leading, spacing: 12){
                        ForEach(chapter.callouts, id: \.self) { callout in
                            Text("• \(callout)")
                        }
                    }
                    .padding()
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.save()
                            let _ = print("save button was tapped")
                        } label: {
                            Text("Save")
                        }
                        
                    }
                }
                
                VStack (alignment: .leading) {
                    
                    TextField("Enter your name", text: $viewModel.journalEntries[0].entry)
                    TextEditor(text: $viewModel.journalEntries[0].entry)
                        .padding(.horizontal)
                        .onTapGesture {}
                    
                }
                
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

