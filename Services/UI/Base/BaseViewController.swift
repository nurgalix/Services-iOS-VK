//
//  BaseViewController.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
