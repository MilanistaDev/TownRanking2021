//
//  TownRankingListView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/22.
//

import SwiftUI

struct TownRankingListView: View {
    
    let selection: TabType
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()], spacing: 0.0) {
                Section {
                    ForEach(0 ..< 10) { index in
                        TownRowView(selection: selection, rank: 1, isRankUp: true, rankFluctuation: 10)
                            .padding(.bottom, 10.0)
                    }
                }
                Section {
                    ForEach(0 ..< 10) { index in
                        SubTownRowView(selection: selection, rank: 11, isRankUp: true, rankFluctuation: 30)
                        Divider()
                    }
                }
            }
            .padding(.all, 16.0)
        }
        .background(Color.gridBackground)
    }
}

struct TownRankingListView_Previews: PreviewProvider {
    static var previews: some View {
        TownRankingListView(selection: .rent)
    }
}
