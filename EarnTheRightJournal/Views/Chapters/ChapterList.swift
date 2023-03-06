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
        NavigationView() {
            NavigationStack {
                List {
                    Section {
                        NavigationLink {
                            About()
                        } label: {
                            Text("About")
                        }
                    }
                    
                    Section {
                        ForEach(chapters) { chapter in
                            NavigationLink {
                                ChapterDetail(chapter: chapter)
                            } label: {
                                ChapterRow(chapter: chapter)
                            }
                            
                        }
                        .navigationTitle("Earn the Right")
                    } header: {
                        Text("Chapters")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                    
                    Section {
                        NavigationLink {
                            // destination view to navigation to
                            OpeningScreen()
                        } label: {
                            Text("Go Back to Opening Screen")
                        }
                    } header: {
                        Text("Settings and Extras")
                            .font(.headline)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ChapterList_Previews: PreviewProvider {
    static var previews: some View {
        ChapterList()
            .environmentObject(ModelData())
    }
}
