//
//  TownRowView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/23.
//

import SwiftUI

struct TownRowView: View {
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
                Image(systemName: rank < 4 ? "crown.fill": "circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: rank < 4 ? 50.0: 30.0, height: rank < 4 ? 50.0: 30.0)
                    .offset(x: .zero, y: rank < 4 ? -5.0: .zero)
                    .foregroundColor(selection == .rent ? .rentOrange: .buyBlue)
                Text(rank.description)
                    .font(rank < 4 ? .title2: .subheadline)
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
            Text("浦安")
                .font(.body)
                .bold()
            Spacer()
            Text("東京メトロ東西線")
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
        TownRowView(selection: .rent, rank: 1, isRankUp: true, rankFluctuation: 10)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        TownRowView(selection: .buy, rank: 4, isRankUp: false, rankFluctuation: 5)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
        TownRowView(selection: .rent, rank: 10, isRankUp: false, rankFluctuation: 0)
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
