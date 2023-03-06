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
    @State var textEditorHeight : CGFloat = 20
    
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
                                .foregroundColor(.primary)
                        }
                        
                        Section {
                            ZStack {
                                Text(viewModel.journalEntries[chapterIndex].entry)
                                                .font(.system(.body))
                                                .foregroundColor(.clear)
                                                .padding(14)
                                                .background(GeometryReader {
                                                    Color.clear.preference(key: ViewHeightKey.self,
                                                                           value: $0.frame(in: .local).size.height)
                                                })
                                TextEditor(text: $viewModel.journalEntries[chapterIndex].entry)
                                    .font(.system(.body))
                                                    .frame(height: max(40,textEditorHeight))
                                                    .cornerRadius(10.0)
                                                                .shadow(radius: 1.0)
                                    .focused($journalIsFocused)
                                    .keyboardResponsive()
                            }.onPreferenceChange(ViewHeightKey.self) { textEditorHeight = $0 }
                            
                        } header: {
                            Text("\(Image(systemName: "square.and.pencil")) Journal - Tap to Edit")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                                .fontWeight(.medium)
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
                    .overlay(Color.gray.opacity(0.3))
            )
        }
    }
}

struct ViewHeightKey: PreferenceKey {
    static var defaultValue: CGFloat { 0 }
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = value + nextValue()
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

