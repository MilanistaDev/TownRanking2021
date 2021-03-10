//
//  ContentPageView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/09.
//

import SwiftUI

struct ContentPageView: View {

    @Binding var selection: TabType
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Rent")
                .tag(TabType.rent)
            Text("Buy")
                .tag(TabType.buy)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.linear(duration: 0.3))
    }
}

struct ContentPageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentPageView(selection: .constant(.rent))
    }
}
