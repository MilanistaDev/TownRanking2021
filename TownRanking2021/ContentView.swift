//
//  ContentView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/06.
//

import SwiftUI

struct ContentView: View {
     @State private var isRent = true

     var body: some View {
         GeometryReader { geometry in
             NavigationView {
                 VStack(alignment: .leading, spacing: .zero) {
                     HStack(spacing: .zero) {
                         Button(action: {
                             withAnimation(.linear(duration: 0.3)) {
                                 self.isRent = true
                             }
                         }, label: {
                             Text("借りて住みたい")
                                 .foregroundColor(self.isRent ? .rentOrange: .gray)
                                 .font(.headline)
                         })
                         .frame(width: geometry.size.width / 2, height: 44.0)
                         Button(action: {
                             withAnimation(.linear(duration: 0.3)) {
                                 self.isRent = false
                             }
                         }, label: {
                             Text("買って住みたい")
                                 .foregroundColor(self.isRent ? .gray: .buyBlue)
                                 .font(.headline)
                         })
                         .frame(width: geometry.size.width / 2, height: 44.0)
                     }
                     Rectangle()
                         .frame(width: geometry.size.width / 2, height: 2.0)
                         .offset(x: self.isRent ? .zero: geometry.size.width / 2, y: .zero)
                         .foregroundColor(self.isRent ? .rentOrange: .buyBlue)
                     Spacer()
                 }
                 .navigationBarTitle("住みたい街ランキング2021(首都圏)", displayMode: .inline)
             }
         }
     }
 }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
