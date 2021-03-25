//
//  ContentPageView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/09.
//

import SwiftUI

struct ContentPageView: View {

    @Binding var selection: TabType
    let safeAreaBottomHeight: CGFloat
    
    var body: some View {
        TabView(selection: $selection) {
            TownRankingListView(selection: selection,
                                safeAreaBottomHeight: safeAreaBottomHeight)
                .tag(TabType.rent)
            TownRankingListView(selection: selection,
                                safeAreaBottomHeight: safeAreaBottomHeight)
                .tag(TabType.buy)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.linear(duration: 0.3))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentPageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentPageView(selection: .constant(.rent),
                        safeAreaBottomHeight: .zero)
    }
}
