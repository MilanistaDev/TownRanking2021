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
                VStack {
                    UpperTabView(isRent: $isRent, geometrySize: geometry.size)
                    Spacer()
                }
                .navigationBarTitle("住みたい街ランキング2021(首都圏)",
                                    displayMode: .inline)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
