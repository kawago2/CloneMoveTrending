//
//  APICaller.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
    case noData
}

public class APICaller {
    
    // MARK: - Trending Movies API
    static func getTrendingMovies(completionHandler: @escaping (_ result: Result<TrendingMoviesModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + "trending/all/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.canNotParseData))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, urlResponse, error) in
            if let error = error {
                completionHandler(.failure(.canNotParseData))
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(TrendingMoviesModel.self, from: data)
                completionHandler(.success(result))
            } catch {
                completionHandler(.failure(.canNotParseData))
                print("Error parsing data: \(error)")
            }
            
        }.resume()
    }
}
