//
//  MainMovieCell.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import UIKit

class MainMovieCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.addBorders(color: .label, width: 1)
        cardView.roundCorners()
        movieImageView.roundCorners(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
    }
 
}
