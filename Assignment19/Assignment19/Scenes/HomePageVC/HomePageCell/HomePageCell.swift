//
//  HomePageCell.swift
//  Assignment19
//
//  Created by MacBook on 30.10.24.
//

import UIKit

final class HomePageCell: UICollectionViewCell {
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont(name: "Nunito-Bold", size: 12)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Nunito-SemiBold", size: 12)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Nunito-SemiBold", size: 12)
        label.textColor = UIColor(hexString: "FFFFFF")
        label.textAlignment = .right
        
        return label
    }()
    
    private lazy var publisherAndDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [authorLabel, dateLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 1
        
        return stackView
    }()
    
    static let identifier = "HomePageCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCell() {
        contentView.addSubview(newsImageView)
        contentView.addSubview(newsLabel)
        contentView.addSubview(publisherAndDateStackView)
        
        setupCellConstraints()
    }
    
    private func setupCellConstraints() {
        NSLayoutConstraint.activate([
            newsImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            newsImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            newsImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            newsImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            newsLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor, constant: 8),
            newsLabel.trailingAnchor.constraint(equalTo: newsImageView.trailingAnchor, constant: -8),
            newsLabel.leadingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            publisherAndDateStackView.topAnchor.constraint(greaterThanOrEqualTo: newsLabel.bottomAnchor, constant: 8),
            publisherAndDateStackView.trailingAnchor.constraint(equalTo: newsLabel.trailingAnchor),
            publisherAndDateStackView.leadingAnchor.constraint(equalTo: newsLabel.leadingAnchor),
            publisherAndDateStackView.bottomAnchor.constraint(equalTo: newsImageView.bottomAnchor, constant: -8)
        ])
    }
    
    public func configureCell(with news: String) {
        
    }
}
