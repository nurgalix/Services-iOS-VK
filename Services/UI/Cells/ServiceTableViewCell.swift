//
//  ServiceTableViewCell.swift
//  Services
//
//  Created by n.nuraly on 30.03.2024.
//

import UIKit
import SnapKit

final class ServiceTableViewCell: BaseTableViewCell {
    
    // MARK: - UI
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.addArrangedSubviews(iconImageView, textsStackView)
        return stackView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var textsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.addArrangedSubviews(titleLabel, subtitleLabel)
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    // MARK: - Override
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        subtitleLabel.text = nil
        iconImageView.image = nil
    }
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        accessoryType = .disclosureIndicator
        
        iconImageView.snp.makeConstraints {
            $0.size.equalTo(60)
        }
        
        contentView.addSubview(mainStackView)
        mainStackView.snp.edgesToSuperview(with: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
}

// MARK: - Configure

extension ServiceTableViewCell {
    
    func configure(with service: Service) {
        titleLabel.text = service.name
        subtitleLabel.text = service.description
        
        if let data = service.iconData {
            iconImageView.image = UIImage(data: data)
        } else if let url = URL(string: service.icon_url) {
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data, error == nil else {
                    return
                }
                service.iconData = data
                DispatchQueue.main.async {
                    self?.iconImageView.image = UIImage(data: data)
                }
            }.resume()
        }
    }
}
