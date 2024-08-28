//
//  ChoiceStarViewController.swift
//  Eatstargram
//
//  Created by 박준영 on 8/27/24.
//

import UIKit

class ChoiceStarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var choiceClosure: ((String) -> Void)?
    
    private var selectedIndexPath: IndexPath?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "평점"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("설정하고 검색하기", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.isEnabled = false  // Disable button initially
        
        // 그림자 효과 추가
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 0.2
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowRadius = 4
            button.layer.masksToBounds = false
        
        button.addAction(UIAction { [weak self] _ in
            if let selectedIndexPath = self?.selectedIndexPath {
                let selectedCategory = Star.allCases[selectedIndexPath.item].displayName
                self?.choiceClosure?(selectedCategory)
            }
            self?.dismiss(animated: true, completion: nil)
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 50)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setupInterface()
    }
    
    private func setupInterface() {
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
        view.addSubview(closeButton)
        
        // Auto Layout constraints
        NSLayoutConstraint.activate([
            // Title label constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            // Collection view constraints
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            collectionView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -20),
            
            // Close button constraints
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            closeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Star.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        // Clear previous content
            cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let category = Star.allCases[indexPath.item]
        
        // Update cell appearance based on selected state
        cell.contentView.backgroundColor = indexPath == selectedIndexPath ? .blue : .lightGray
        cell.contentView.layer.cornerRadius = 8
        
        cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.2
            cell.layer.shadowOffset = CGSize(width: 0, height: 2)
            cell.layer.shadowRadius = 4
            cell.layer.masksToBounds = false
        
        let label = UILabel()
        label.text = "\(category.displayName)점"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        cell.contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: cell.contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: cell.contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: cell.contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: cell.contentView.trailingAnchor)
        ])
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Update previously selected cell
        if let previousIndexPath = selectedIndexPath, previousIndexPath != indexPath {
            let previousCell = collectionView.cellForItem(at: previousIndexPath)
            previousCell?.contentView.backgroundColor = .lightGray
        }
        
        // Update newly selected cell
        selectedIndexPath = indexPath
        let selectedCell = collectionView.cellForItem(at: indexPath)
        selectedCell?.contentView.backgroundColor = .brown
        
        // Enable and update close button
        closeButton.backgroundColor = .systemBlue
        closeButton.isEnabled = true
    }
}

#Preview {
    ChoiceStarViewController()
}
