//
//  ExpandButtonView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/26.
//

import SwiftUI

struct ExpandButtonView: View {
    
    let selection: TabType
    @Binding var isExpanded: Bool
    
    var body: some View {
        Button {
            self.isExpanded.toggle()
        } label: {
            HStack {
                Text(isExpanded ? "閉じる": "11位以降を見る")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.white)
                Image(systemName: isExpanded ? "chevron.up": "chevron.down")
                    .foregroundColor(.white)
            }
            .frame(height: 52.0)
            .frame(minWidth: .zero, maxWidth: .infinity)
            .background(selection == .rent ? Color.rentOrange: Color.buyBlue)
            .cornerRadius(8.0)
        }
    }
}

struct ExpandButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ExpandButtonView(selection: .rent, isExpanded: .constant(false))
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
            ExpandButtonView(selection: .rent, isExpanded: .constant(true))
                .previewLayout(PreviewLayout.sizeThatFits)
                .padding()
                .background(Color(.systemBackground))
        }
    }
}
