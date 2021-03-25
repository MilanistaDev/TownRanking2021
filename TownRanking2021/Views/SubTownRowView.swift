//
//  SubTownRowView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/26.
//

import SwiftUI

struct SubTownRowView: View {
    let selection: TabType
    let rank: Int
    let isRankUp: Bool
    let rankFluctuation: Int
    
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
                Text(rank.description)
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
            }
            ZStack {
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 50.0, height: 50.0)
                VStack(spacing: 4.0) {
                    if !isRankUp && rankFluctuation == 0 {
                        Image(systemName: "minus.circle.fill")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(.gray)
                        Text("キープ")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    } else {
                        Image(systemName: isRankUp ? "arrow.up.circle.fill": "arrow.down.circle.fill")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .foregroundColor(isRankUp ? .red: .blue)
                        Text(rankFluctuation.description + (isRankUp ? "アップ": "ダウン"))
                            .font(.footnote)
                            .foregroundColor(isRankUp ? .red: .blue)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 4.0) {
                Text("妙典")
                    .font(.subheadline)
                    .bold()
                Text("東京メトロ東西線")
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
        SubTownRowView(selection: .rent, rank: 11, isRankUp: true, rankFluctuation: 10)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        SubTownRowView(selection: .buy, rank: 20, isRankUp: false, rankFluctuation: 5)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        SubTownRowView(selection: .rent, rank: 20, isRankUp: false, rankFluctuation: 0)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
