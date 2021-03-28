//
//  SubTownRowView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/26.
//

import SwiftUI

struct SubTownRowView: View {
    let selection: TabType
    let townInfo: TownInfo
    
    var body: some View {
        HStack(spacing: 16.0) {
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 50.0, height: 50.0)
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30.0, height: 30.0)
                    .foregroundColor(selection == .rent ? .subRentOrange: .subBuyBlue)
                Text(townInfo.rank.description)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
            }
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 50.0, height: 50.0)
                VStack(spacing: 4.0) {
                    if !townInfo.isRankUp && townInfo.rankFluctuation == 0 {
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(.gray)
                        Text("キープ")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: townInfo.isRankUp ? "arrow.up.circle.fill": "arrow.down.circle.fill")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(townInfo.isRankUp ? .red: .blue)
                        Text(townInfo.rankFluctuation.description + (townInfo.isRankUp ? "アップ": "ダウン"))
                            .font(.footnote)
                            .foregroundColor(townInfo.isRankUp ? .red: .blue)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 4.0) {
                Text(townInfo.townName)
                    .font(.subheadline)
                    .bold()
                Text(townInfo.availableLine)
                    .lineLimit(nil)
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            Spacer()
        }
        .padding(.horizontal, 16.0)
        .padding(.vertical, 4.0)
        .background(Color.rowBackground)
    }
}

struct SubTownRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SubTownRowView(selection: .rent, townInfo: dummyTownRankingData.townRankingsForRent[4])
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .light)
                .previewDisplayName("Rank 11, Rent, Light mode")
            SubTownRowView(selection: .rent, townInfo: dummyTownRankingData.townRankingsForRent[4])
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Rank 11, Rent, Dark mode")
            SubTownRowView(selection: .buy, townInfo: dummyTownRankingData.townRankingsForBuy[4])
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .light)
                .previewDisplayName("Rank 11, Buy, Light mode")
            SubTownRowView(selection: .buy, townInfo: dummyTownRankingData.townRankingsForBuy[4])
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Rank 11, Buy, Dark mode")
        }
    }
}
