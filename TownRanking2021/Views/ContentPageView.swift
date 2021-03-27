//
//  ContentPageView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/09.
//

import SwiftUI

struct ContentPageView: View {

    @Binding var selection: TabType
    let townRankingData: TownRankingData
    let safeAreaBottomHeight: CGFloat
    
    var body: some View {
        TabView(selection: $selection) {
            TownRankingListView(selection: selection,
                                townInfo: townRankingData.townRankingsForRent,
                                safeAreaBottomHeight: safeAreaBottomHeight)
                .tag(TabType.rent)
            TownRankingListView(selection: selection,
                                townInfo: townRankingData.townRankingsForBuy,
                                safeAreaBottomHeight: safeAreaBottomHeight)
                .tag(TabType.buy)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.linear(duration: 0.3))
        // APIで取得しても画面更新されないため
        .id(townRankingData.townRankingsForRent.hashValue)
    }
}

struct ContentPageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentPageView(selection: .constant(.rent),
                        townRankingData: dummyTownRankingData,
                        safeAreaBottomHeight: .zero)
    }
}
