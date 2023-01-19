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
    @Binding var journal: String
    
    var chapterIndex: Int {
        modelData.chapters.firstIndex(where: { $0.id == chapter.id})!
    }
    
    
    
    var body: some View {
        
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
            VStack (alignment: .leading) {
                //links to new journal view to enter in text.
                NavigationLink {
                    ChapterJournal(journal: $modelData.chapters[chapterIndex].journal)
                } label: {
                    Text("Edit Journal Entry")
                        .font(.title3)
                        .foregroundColor(.secondary)
                }
                //Text from the journal entry will be displayed here:
//                Text(modelData.chapters[chapterIndex].journal)
            }
            .padding()
            NavigationStack {
                TextEditor(text: $journal)
                    .padding(.horizontal)
                    .navigationTitle("Journal Entry")
                    .onTapGesture {}
            }
        }
        
        //.fullBackground(imageName: "blueWater")

    }
}

//public extension View {
//    func fullBackground(imageName: String) -> some View {
//       return background(
//                Image(imageName)
//                    .resizable()
//                    .scaledToFill()
//                    .edgesIgnoringSafeArea(.all)
//                    .opacity(0.2)
//                    .frame(height: 500)
//       )
//    }
//}

//MARK: - Preview Code
struct ChapterDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        ChapterDetail(chapter: modelData.chapters[0], journal: .constant("journalText"))
            .environmentObject(modelData)
    }
}

