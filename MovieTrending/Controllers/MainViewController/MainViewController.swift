//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import UIKit
import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    private let bag: DisposeBag = DisposeBag()
    var viewModel: MainViewModel!
    var cellDataSource: [Movie] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        configView()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData()
    }
    
    // MARK: - View Configuration
    func configView() {
        self.title = "Top Trending Movies"
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
        self.activityIndicator.hidesWhenStopped = true
    }
    
    // MARK: - ViewModel Binding
    private func bindViewModel() {
        viewModel.cellData.asObservable().subscribe(onNext: { [weak self] movie in
            guard let self = self, let data = movie else { return }
            self.cellDataSource.append(contentsOf: data)
            self.reloadTableView()
        }).disposed(by: bag)
        
        viewModel.isLoading.asObservable().subscribe(onNext: {[weak self] state in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if state {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
           
        }).disposed(by: bag)
//        viewModel.isLoading.bind({[weak self] isLoading in
//            guard let self = self, let isLoading = isLoading else {return}
//
//            DispatchQueue.main.async {
//                if isLoading {
//                    self.activityIndicator.startAnimating()
//                } else {
//                    self.activityIndicator.stopAnimating()
//                }
//            }
//        })
//
//        viewModel.cellDataSource.bind({[weak self] movies in
//            guard let self = self, let movies = movies else {return}
//            self.cellDataSource = movies
//            self.reloadTableView()
//        })
    }
    
    // MARK: - Navigation
    func openDetail(movieID: Int) {
        guard let movie = viewModel.retriveMovie(with: movieID) else {return}
        
        let model = DetailsViewModel(movie: movie)
        let vc = DetailsViewController(viewModel: model)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}

            
        
                                      
                                      
                                      
