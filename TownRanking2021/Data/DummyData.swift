//
//  DummyData.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/26.
//

import Foundation

let initialData: TownRankingData = TownRankingData(townRankingsForRent: [], townRankingsForBuy: [])

let dummyTownRankingData: TownRankingData =
    TownRankingData(townRankingsForRent: [
        TownInfo(rank: 1, townName: "本厚木", isRankUp: true, rankFluctuation: 3, availableLine: "小田急小田原線"),
        TownInfo(rank: 2, townName: "大宮", isRankUp: true, rankFluctuation: 3, availableLine: "JR京浜東北・根岸線ほか"),
        TownInfo(rank: 3, townName: "葛西", isRankUp: false, rankFluctuation: 1, availableLine: "東京メトロ東西線"),
        TownInfo(rank: 4, townName: "八王子", isRankUp: true, rankFluctuation: 3, availableLine: "JR中央線ほか"),
        TownInfo(rank: 11, townName: "高円寺", isRankUp: true, rankFluctuation: 2, availableLine: "JR中央線ほか")
    ],
    townRankingsForBuy: [
        TownInfo(rank: 1, townName: "勝どき", isRankUp: false, rankFluctuation: 0, availableLine: "都営大江戸線"),
        TownInfo(rank: 2, townName: "白金高輪", isRankUp: true, rankFluctuation: 17, availableLine: "東京メトロ南北線ほか"),
        TownInfo(rank: 3, townName: "本厚木", isRankUp: true, rankFluctuation: 8, availableLine: "小田急小田原線"),
        TownInfo(rank: 4, townName: "三鷹", isRankUp: false, rankFluctuation: 1, availableLine: "JR中央線ほか"),
        TownInfo(rank: 11, townName: "橋本", isRankUp: true, rankFluctuation: 31, availableLine: "JR横浜線ほか")
    ])
