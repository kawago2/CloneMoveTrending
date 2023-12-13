//
//  MainViewController.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Properties
    var viewModel: MainViewModel!
    var cellDataSource: [MovieTableCellViewModel] = []
    
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
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
        self.activityIndicator.hidesWhenStopped = true
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind({[weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {return}
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        })
        
        viewModel.cellDataSource.bind({[weak self] movies in
            guard let self = self, let movies = movies else {return}
            self.cellDataSource = movies
            self.reloadTableView()
        })
    }
}

            
        
                                      
                                      
                                      
