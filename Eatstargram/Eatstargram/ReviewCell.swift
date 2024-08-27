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
        label.textAlignment = .center
        return label
    }()
    
    lazy var visitLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var reviewImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var reviewRateView: UIStackView = {
        let stackView = UIStackView()
        stackView.tintColor = .red
        return stackView
    }()
    
    lazy var reviewContentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        return label
    }()
    
    lazy var bodyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        
        return stackView
    }()
    
    lazy var headerStackView: UIStackView = {
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
        
        headerStackView.addArrangedSubview(nameLabel)
        headerStackView.addArrangedSubview(visitLabel)
        
        reviewImageView.addSubview(reviewRateView)
        
        bodyStackView.addArrangedSubview(reviewImageView)
        bodyStackView.addArrangedSubview(reviewContentLabel)
        
        reviewStackView.addArrangedSubview(headerStackView)
        reviewStackView.addArrangedSubview(bodyStackView)
        
        reviewRateView.translatesAutoresizingMaskIntoConstraints = false
        reviewImageView.translatesAutoresizingMaskIntoConstraints = false
        reviewStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            reviewImageView.heightAnchor.constraint(equalToConstant: 250),
            nameLabel.leadingAnchor.constraint(equalTo: headerStackView.leadingAnchor, constant: 10),
            visitLabel.trailingAnchor.constraint(equalTo: headerStackView.trailingAnchor, constant: -500),
            reviewContentLabel.trailingAnchor.constraint(equalTo: bodyStackView.trailingAnchor, constant: -5),
            reviewRateView.leadingAnchor.constraint(equalTo: reviewImageView.leadingAnchor, constant: 10),
            reviewRateView.bottomAnchor.constraint(equalTo: reviewImageView.bottomAnchor, constant: -10),
            reviewImageView.widthAnchor.constraint(equalTo:contentView.widthAnchor),
            reviewStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            reviewStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            reviewStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            reviewStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
//            emojiLabel.widthAnchor.constraint(equalToConstant: 30),
//            memoImageView.heightAnchor.constraint(equalTo: memoImageView.widthAnchor), // 정사각형 만들기
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
