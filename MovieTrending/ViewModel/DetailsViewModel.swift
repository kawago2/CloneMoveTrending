//
//  DetailsViewModel.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation

class DetailsViewModel {
    
    var movie: Movie
    
    var movieImage: URL?
    var movieTitle: String
    var movieBody: String
    var movieID: Int
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieID = movie.id ?? 0
        self.movieTitle = movie.name ?? movie.title ?? ""
        self.movieBody = movie.overview ?? ""
        self.movieImage = makeImageURL(movie.backdropPath ?? "")
    }
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.shared.imageServerAddress)\(imageCode)")
    }
    
}
