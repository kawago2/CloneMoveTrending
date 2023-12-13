//
//  DetailsViewModel.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation

class DetailsViewModel {
    
    // MARK: - Properties
    var movie: Movie
    var movieImage: URL?
    var movieTitle: String
    var movieBody: String
    var movieID: Int
    
    // MARK: - Initialization

    init(movie: Movie) {
        self.movie = movie
        self.movieID = movie.id ?? 0
        self.movieTitle = movie.name ?? movie.title ?? ""
        self.movieBody = movie.overview ?? ""
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    // MARK: - Private Methods
    private func makeImageURL(_ imageCode: String) -> URL? {
        return URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
}
