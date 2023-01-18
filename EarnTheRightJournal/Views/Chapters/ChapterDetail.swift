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
                //This will be a placeholder for the journal text entered into the app. There will be a modal screen that pops up for the user to enter in their response to the callout questions above. For now, it is just a text field.
//                Text(modelData.chapters[chapterIndex].journal)
                JournalEntry(journal: $modelData.chapters[chapterIndex].journal)
            }
            .padding()
            .background(Color.accentColor)
        }
        
        .fullBackground(imageName: "blueWater")

    }
}

public extension View {
    func fullBackground(imageName: String) -> some View {
       return background(
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.2)
                    .frame(height: 500)
       )
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

