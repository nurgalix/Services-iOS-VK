//
//  UIStackView+Extensions.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
