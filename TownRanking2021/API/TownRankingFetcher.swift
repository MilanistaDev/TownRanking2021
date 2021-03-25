//
//  TownRankingFetcher.swift
//  TownRanking2021
//
//  Created by Takuya Aso on 2021/03/26.
//

import Foundation

class TownRankingFetcher {
    func fetchTownRanking(completion: @escaping (Result<TownRankingData, Error>) -> Void) {
        guard let path = Bundle.main.path(forResource: "TownRanking2021", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let fetchedData = try JSONDecoder().decode(TownRankingData.self, from: data)
            DispatchQueue.main.async {
                completion(.success(fetchedData))
            }
        } catch  {
            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }
    }
}

// [参考]APIの場合はこっち
//func fetchTownRanking(completion: @escaping (Result<TownRankingData, Error>) -> Void) {
//    URLSession.shared.dataTask(with: URL(string: APIのリンク)!) { (data, response, error) in
//        guard let data = data else { return }
//        let decoder: JSONDecoder = JSONDecoder()
//        do {
//            let fetchedData = try decoder.decode(TownRankingData.self, from: data)
//            DispatchQueue.main.async {
//                completion(.success(fetchedData))
//            }
//        } catch {
//            DispatchQueue.main.async {
//                completion(.failure(error))
//            }
//        }
//    }.resume()
//}
