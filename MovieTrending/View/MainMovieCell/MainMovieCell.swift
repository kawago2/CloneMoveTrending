//
//  MainMovieCell.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import UIKit
import Kingfisher

class MainMovieCell: UITableViewCell {
    
    // MARK: - Properties
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }

    // MARK: - Registration
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    // MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        cardView.addBorders(color: .label, width: 1)
        cardView.roundCorners()
        cardView.backgroundColor = .lightGray
        
        movieImageView.roundCorners(5)
    }
    
    // MARK: - Cell Setup
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        
        self.movieImageView.kf.setImage(with: viewModel.imageUrl)
    }
 
}
