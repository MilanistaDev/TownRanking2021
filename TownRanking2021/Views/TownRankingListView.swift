//
//  TownRankingListView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/22.
//

import SwiftUI

struct TownRankingListView: View {
    
    let selection: TabType
    let townInfo: [TownInfo]
    let safeAreaBottomHeight: CGFloat
    @State private var isExpanded = false
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], spacing: 0.0) {
                Section {
                    ForEach(0 ..< min(townInfo.count, 10)) { index in
                        TownRowView(selection: selection,
                                    townInfo: townInfo[index])
                            .padding(.bottom, 10.0)
                    }
                }
                if isExpanded {
                    Section {
                        ForEach(min(townInfo.count, 10) ..< townInfo.count) { index in
                            SubTownRowView(selection: selection,
                                           townInfo: townInfo[index])
                            Divider()
                        }
                    }
                }
            }
            .padding(.all, 16.0)
            // データ取得前は表示させない
            if !townInfo.isEmpty {
                ExpandButtonView(selection: selection, isExpanded: $isExpanded)
                    .padding(.horizontal, 16.0)
                    .padding(.bottom, 16.0 + safeAreaBottomHeight)
            }
        }
        .background(Color.gridBackground)
    }
}

struct TownRankingListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TownRankingListView(selection: .rent,
                                townInfo: dummyTownRankingData.townRankingsForRent,
                                safeAreaBottomHeight: .zero)
                .previewLayout(PreviewLayout.sizeThatFits)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .light)
                .previewDisplayName("TownRankingListView(Rent, Light mode)")
            TownRankingListView(selection: .rent,
                                townInfo: dummyTownRankingData.townRankingsForRent,
                                safeAreaBottomHeight: .zero)
                .previewLayout(PreviewLayout.sizeThatFits)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("TownRankingListView(Rent, Dark mode)")
            TownRankingListView(selection: .buy,
                                townInfo: dummyTownRankingData.townRankingsForBuy,
                                safeAreaBottomHeight: .zero)
                .previewLayout(PreviewLayout.sizeThatFits)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .light)
                .previewDisplayName("TownRankingListView(Buy, Light mode)")
            TownRankingListView(selection: .buy,
                                townInfo: dummyTownRankingData.townRankingsForBuy,
                                safeAreaBottomHeight: .zero)
                .previewLayout(PreviewLayout.sizeThatFits)
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("TownRankingListView(Buy, Dark mode)")
        }
    }
}
