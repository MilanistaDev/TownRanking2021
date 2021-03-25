//
//  TownRankingViewModel.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/26.
//

import SwiftUI

class TownRankingViewModel: ObservableObject {
    @Published var townRankingData = initialData
    @Published var isShowIndicator = true
    
    let fetcher = TownRankingFetcher()

    init() {
        fetcher.fetchTownRanking { result in
            sleep(4)
            switch result {
            case .success(let townRankingData):
                self.townRankingData = townRankingData
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.isShowIndicator = false
        }
    }
}
