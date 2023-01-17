//
//  Drop.swift
//  EarnTheRightJournal
//
//  Created by Auston Youngblood on 1/17/23.
//

import SwiftUI

struct Drop: View {
    var body: some View {
        Image("drop")
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.cyan, lineWidth: 4)
            }
            .shadow(radius: 7)
            
    }
}

struct Drop_Previews: PreviewProvider {
    static var previews: some View {
        Drop()
    }
}
