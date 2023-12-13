//
//  DetailsViewController.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import UIKit
import Kingfisher
class DetailsViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    // MARK: - Properties
    private var viewModel: DetailsViewModel!
    
    // MARK: - Initialization
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
    }
    
    // MARK: - View Configuration
    func configView() {
        self.title = viewModel.movieTitle
        titleLabel.text = viewModel.movieTitle
        bodyLabel.text = viewModel.movieBody
        
        imageView.kf.setImage(with: viewModel.movieImage)
    }

}
