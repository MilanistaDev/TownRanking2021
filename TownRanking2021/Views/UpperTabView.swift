//
//  UpperTabView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/07.
//

import SwiftUI

struct UpperTabView: View {

    @Binding var selection: TabType
    let geometrySize: CGSize

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack(spacing: .zero) {
                Button(action: {
                    self.selection = .rent
                }, label: {
                    Text("借りて住みたい")
                        .foregroundColor(self.selection == .rent ?
                                            .rentOrange: .gray)
                         .font(.headline)
                })
                .frame(width: geometrySize.width / 2, height: 44.0)
                Button(action: {
                    self.selection = .buy
                }, label: {
                    Text("買って住みたい")
                        .foregroundColor(self.selection == .rent ?
                                            .gray: .buyBlue)
                        .font(.headline)
                })
                .frame(width: geometrySize.width / 2, height: 44.0)
            }
            Rectangle()
                .fill(self.selection == .rent ? Color.rentOrange: Color.buyBlue)
                .frame(width: geometrySize.width / 2, height: 2.0)
                .offset(x: self.selection == .rent ? .zero: geometrySize.width / 2, y: .zero)
                .animation(.linear(duration: 0.3))
        }
    }
}

struct UpperTabView_Previews: PreviewProvider {
    static var previews: some View {
        UpperTabView(selection: .constant(.rent), geometrySize: UIScreen.main.bounds.size)
    }
}
