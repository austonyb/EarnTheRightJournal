//
//  Welcome.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/19/23.
//

import SwiftUI

struct Welcome: View {
    @State private var quote: String = ""
        @State private var isLoading: Bool = false
        @State private var showNextView: Bool = false
        private let url = URL(string: "https://uselessfacts.jsph.pl/random.json?language=en")!

        var body: some View {
            NavigationView {
                VStack {
                    if isLoading {
                        VStack {
                            Text("Loading...")
                            LoadingWheel()
                        }
                    } else {
                        VStack {
                            Spacer()
                            Text("Random Fact for you:")
                                .font(.title2)
                                .padding()
                            Text(quote)
                            LoadingWheel()
                                .transition(.scale)
                        }
                    }
                    if showNextView {
                        NavigationLink(destination: ChapterList()
                            .environmentObject(ModelData()), isActive: $showNextView) {
                            EmptyView()
                        }
                    }
                }
                .padding()
            .onAppear(perform: loadQuote)
            }
        }

        private func loadQuote() {
            isLoading = true
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error loading data: \(error.localizedDescription)")
                    return
                }
                guard let data = data else {
                    print("Error loading data")
                    return
                }
                let quote = try? JSONDecoder().decode(Quote.self, from: data)
                DispatchQueue.main.async {
                    self.quote = quote?.text ?? ""
                    self.isLoading = false
                    // show next view after 3 sec
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.showNextView.toggle()
                    }
                }
            }.resume()
        }
    }

struct Quote: Codable {
    let text: String
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
