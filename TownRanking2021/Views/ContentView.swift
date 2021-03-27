//
//  ContentView.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/06.
//

import SwiftUI

enum TabType: Int {
    case rent
    case buy
}

struct ContentView: View {
    @State private var selection: TabType = .rent
    @ObservedObject private var townRankingVM = TownRankingViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack(spacing: .zero) {
                    UpperTabView(selection: $selection,
                                 geometrySize: geometry.size)
                    ContentPageView(selection: $selection,
                                    townRankingData: townRankingVM.townRankingData,
                                    safeAreaBottomHeight: geometry.safeAreaInsets.bottom)
                }
                .edgesIgnoringSafeArea(.bottom)
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
