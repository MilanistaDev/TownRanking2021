//
//  TownRankingViewModel.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/26.
//

import SwiftUI

class TownRankingViewModel: ObservableObject {
    
    @Published var townRankingData = initialData
    let fetcher = TownRankingFetcher()

    init() {
        fetcher.fetchTownRanking { result in
            switch result {
            case .success(let townRankingData):
                self.townRankingData = townRankingData
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
