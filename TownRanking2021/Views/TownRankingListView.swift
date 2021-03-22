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
                ForEach(0 ..< 10) { index in
                    Rectangle()
                        .fill(selection == .rent ? Color.rentOrange: Color.buyBlue)
                        .frame(height: 50)
                        .cornerRadius(8.0)
                        .padding(.bottom, 10.0)
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
