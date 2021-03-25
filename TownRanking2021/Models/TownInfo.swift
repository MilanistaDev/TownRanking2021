//
//  TownInfo.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/26.
//

import Foundation

struct TownInfo: Decodable, Hashable {
    var rank: Int
    var townName: String
    var isRankUp: Bool
    var rankFluctuation: Int
    var availableLine: String
}
