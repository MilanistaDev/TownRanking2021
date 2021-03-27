//
//  TownRowView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/23.
//

import SwiftUI

struct TownRowView: View {
    let selection: TabType
    let townInfo: TownInfo
    
    var body: some View {
        HStack(spacing: 16.0) {
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 50.0, height: 50.0)
                Image(systemName: townInfo.rank < 4 ? "crown.fill": "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: townInfo.rank < 4 ? 50.0: 30.0, height: townInfo.rank < 4 ? 50.0: 30.0)
                    .offset(x: .zero, y: townInfo.rank < 4 ? -5.0: .zero)
                    .foregroundColor(selection == .rent ? .rentOrange: .buyBlue)
                Text(townInfo.rank.description)
                    .font(townInfo.rank < 4 ? .title2: .subheadline)
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
            Text(townInfo.townName)
                .font(.body)
                .bold()
            Spacer()
            Text(townInfo.availableLine)
                .frame(width: 90.0)
                .lineLimit(nil)
                .foregroundColor(.gray)
                .font(.footnote)
        }
        .padding(.horizontal, 16.0)
        .padding(.vertical, 10.0)
        .background(Color.rowBackground)
        .cornerRadius(8.0)
        .shadow(color: Color.black.opacity(0.16), radius: 3.0, x: .zero, y: 3.0)
    }
}

struct TownRowView_Previews: PreviewProvider {
    static var previews: some View {
        TownRowView(selection: .rent, townInfo: dummyTownRankingData.townRankingsForRent[0])
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        TownRowView(selection: .buy, townInfo: dummyTownRankingData.townRankingsForBuy[0])
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        TownRowView(selection: .rent, townInfo: dummyTownRankingData.townRankingsForRent[0])
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
