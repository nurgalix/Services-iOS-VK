//
//  SnapKit+Extensions.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

import SnapKit

extension ConstraintViewDSL {
    
    func edgesToSuperview(with insets: UIEdgeInsets = .zero) {
        makeConstraints { $0.edges.equalToSuperview().inset(insets) }
    }
}
