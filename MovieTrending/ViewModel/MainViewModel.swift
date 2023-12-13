//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation

class MainViewModel {
    
    
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        10
    }
    
    func getData() {
        APICaller.getTrendingMovies(completionHandler: {result in
            switch result {
            case .success(let data):
                print("Top trend count: \(String(describing: data.results?.count))")
            case .failure(let err):
                print(err)
            }
            
        })
    }
}
