//
//  MenuCell.swift
//  Eatstargram
//
//  Created by 강승우 on 2024/08/27.
//

import UIKit

class MenuCell: UITableViewCell {
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        return label
    }()
    
    public lazy var priceLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var menuStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(menuStackView)
        
        menuStackView.addArrangedSubview(nameLabel)
        menuStackView.addArrangedSubview(priceLabel)
        
        menuStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            menuStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            menuStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            menuStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            menuStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
