//
//  ReviewCell.swift
//  Eatstargram
//
//  Created by 강승우 on 2024/08/27.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var visitLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    lazy var reviewCntLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    lazy var avgRateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    lazy var reviewImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var reviewRateView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    lazy var reviewContentLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var bodyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    lazy var firstHeaderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .leading
        return stackView
    }()
    
    lazy var secondHeaderStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    private lazy var reviewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(reviewStackView)
        
        nameLabel.textAlignment = .left
        
        firstHeaderStackView.addArrangedSubview(nameLabel)
        firstHeaderStackView.addArrangedSubview(reviewCntLabel)
        firstHeaderStackView.addArrangedSubview(avgRateLabel)
        firstHeaderStackView.addArrangedSubview(visitLabel)
        
        secondHeaderStackView.addArrangedSubview(reviewRateView)
        
//        reviewImageView.addSubview(reviewRateView)
        
        bodyStackView.addArrangedSubview(reviewContentLabel)
        bodyStackView.addArrangedSubview(reviewImageView)
        
        reviewStackView.addArrangedSubview(firstHeaderStackView)
        reviewStackView.addArrangedSubview(secondHeaderStackView)
        reviewStackView.addArrangedSubview(bodyStackView)
        
        reviewRateView.translatesAutoresizingMaskIntoConstraints = false
        reviewImageView.translatesAutoresizingMaskIntoConstraints = false
        reviewStackView.translatesAutoresizingMaskIntoConstraints = false
        secondHeaderStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewImageView.heightAnchor.constraint(equalToConstant: 250),
            firstHeaderStackView.leadingAnchor.constraint(equalTo: reviewStackView.leadingAnchor),
            firstHeaderStackView.trailingAnchor.constraint(equalTo: reviewStackView.trailingAnchor),
            secondHeaderStackView.leadingAnchor.constraint(equalTo: reviewStackView.leadingAnchor),
            secondHeaderStackView.trailingAnchor.constraint(equalTo: reviewStackView.leadingAnchor, constant: 110),
            reviewImageView.widthAnchor.constraint(equalToConstant: 300),
            reviewStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            reviewStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            reviewStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            reviewStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
