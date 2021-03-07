//
//  UpperTabView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/07.
//

import SwiftUI

struct UpperTabView: View {

    @Binding var isRent: Bool
    let geometrySize: CGSize

    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            HStack(spacing: .zero) {
                Button(action: {
                    withAnimation(.linear(duration: 0.3)) {
                        self.isRent = true
                    }
                }, label: {
                    Text("借りて住みたい")
                        .foregroundColor(self.isRent ?
                                            .rentOrange: .gray)
                         .font(.headline)
                })
                .frame(width: geometrySize.width / 2, height: 44.0)
                Button(action: {
                    withAnimation(.linear(duration: 0.3)) {
                        self.isRent = false
                    }
                }, label: {
                    Text("買って住みたい")
                        .foregroundColor(self.isRent ?
                                            .gray: .buyBlue)
                        .font(.headline)
                })
                .frame(width: geometrySize.width / 2, height: 44.0)
            }
            Rectangle()
                .fill(self.isRent ? Color.rentOrange: Color.buyBlue)
                .frame(width: geometrySize.width / 2, height: 2.0)
                .offset(x: self.isRent ? .zero: geometrySize.width / 2, y: .zero)
        }
    }
}

struct UpperTabView_Previews: PreviewProvider {
    static var previews: some View {
        UpperTabView(isRent: .constant(true), geometrySize: UIScreen.main.bounds.size)
    }
}
