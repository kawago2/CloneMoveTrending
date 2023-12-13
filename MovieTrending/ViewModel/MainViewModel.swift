//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation

class MainViewModel {
    
    // MARK: - Properties
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable([])
    var dataSource: TrendingMoviesModel?
    
    // MARK: - Data Source
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.dataSource?.results?.count ?? 0
    }
    
    // MARK: - Networking
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies(completionHandler: {[weak self] result in
            guard let self = self else {return}
            self.isLoading.value = false    
            switch result {
            case .success(let data):
                if let result = data.results {
                    print("Top trend count: \(result.count)")
                }
                self.dataSource = data
                self.mapCellData()
            case .failure(let err):
                print(err)
            }
            
        })
    }
    
    // MARK: - Data Mapping
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results?.compactMap({MovieTableCellViewModel(movies: $0)
        })
    }
    
    // MARK: - Helper Methods
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title ?? movie.name ?? ""
    }
    
    func retriveMovie(with id: Int) -> Movie? {
        guard let movie = dataSource?.results?.first(where: {$0.id == id}) else {
            return nil
        }
        return movie
    }
}
