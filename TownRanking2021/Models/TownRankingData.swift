//
//  TownRankingData.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/26.
//

import Foundation

struct TownRankingData: Decodable {
    var townRankingsForRent: [TownInfo]
    var townRankingsForBuy: [TownInfo]
}
