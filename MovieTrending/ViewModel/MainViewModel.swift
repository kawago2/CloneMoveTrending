//
//  MainViewModel.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation
import RxSwift
import RxRelay

class MainViewModel {
    
    // MARK: - Properties
    var isLoading: BehaviorRelay = BehaviorRelay<Bool>(value: false)
    var cellData: BehaviorRelay = BehaviorRelay<[Movie]?>(value: nil)
//    var isLoading: Observable<Bool> = Observable(false)
//    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable([])
    var dataSource: TrendingMoviesModel?
    
    // MARK: - Data Source
    func numberOfSections() -> Int {
        1
    }
    
    func numberOfRows(in section: Int) -> Int {
        self.cellData.value?.count ?? 0
    }
    
    // MARK: - Networking
    func getData() {
        isLoading.accept(true)
        APICaller.getTrendingMovies(completionHandler: {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.cellData.accept(data.results)
                self.isLoading.accept(false)
            case .failure(let err):
                self.isLoading.accept(false)
                print(err)
            }
            
        })
    }
    
    // MARK: - Data Mapping
//    func mapCellData() {
//        self.cellData.accept(<#T##event: [MovieTableCellViewModel]?##[MovieTableCellViewModel]?#>) self.dataSource?.results?.compactMap({MovieTableCellViewModel(movies: $0)
//        })
//    }
    
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
