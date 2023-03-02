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
    @FocusState private var journalIsFocused: Bool
    private let localVideoName = "drop"
    
    var chapterIndex: Int {
        modelData.chapters.firstIndex(where: { $0.id == chapter.id})!
    }
    
    
    var body: some View {
        
        NavigationView {
            VStack() {
                
                Form {
                    Section {
                        ForEach(chapter.callouts, id: \.self) { callout in
                            Text("- \(callout)")
                        }
                    } header: {
                        Text("Callouts")
                            .font(.title)
                            .fontWeight(.black)
                    }
                    
                    Section {
                        TextEditor(text: $viewModel.journalEntries[chapterIndex].entry)
                            .focused($journalIsFocused)
                        Text(viewModel.journalEntries[chapterIndex].entry)
                    } header: {
                        Text("Journal")
                    }
                }
                .scrollContentBackground(.hidden)
                .navigationTitle(chapter.header)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Save") {
                            viewModel.save()
                            journalIsFocused = false
                        }
                    }
                }
            }
            .background(
                BgdFullScreenVideoView(videoName: localVideoName)
                    .overlay(Color.black.opacity(0.2))
            )
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

