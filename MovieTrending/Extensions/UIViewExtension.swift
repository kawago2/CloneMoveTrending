//
//  UIViewExtension.swift
//  MovieTrending
//
//  Created by Phincon on 13/12/23.
//

import Foundation
import UIKit

extension UIView {
    // MARK: - Corner Radius
    func roundCorners(_ radius: CGFloat = 10) {
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    // MARK: - Borders
    func addBorders(color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
