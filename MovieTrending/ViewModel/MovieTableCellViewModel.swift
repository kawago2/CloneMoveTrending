//
//  MovieTableCellViewModel.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation

class MovieTableCellViewModel {
    var id: Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    
    init(movies: Movie) {
        self.id = movies.id ?? 0
        self.title = movies.title ?? movies.name ?? ""
        self.date = movies.releaseDate ?? movies.firstAirDate ?? ""
        self.rating = "\(movies.voteAverage ?? 0.0)/10"
        self.imageUrl = makeImageURL(movies.posterPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
