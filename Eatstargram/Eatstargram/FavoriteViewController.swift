//
//  FavoriteViewController.swift
//  Eatstargram
//
//  Created by Soom on 8/27/24.
//
import UIKit


class FavoriteViewController: UIViewController {
    let favoriteItems: [FavoriteItem] = Array(repeating: FavoriteItem(favoriteStoreName: "대박 아구찜", location: "은병구 연서로 29길 8-13", visitCount: "22", ratingScore: "4.5"), count: 30)
    lazy var vStackView:UIStackView = {
        let vStackView = UIStackView()
        vStackView.axis = .vertical
        vStackView.spacing = 10
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        return vStackView
    }()
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
       return scrollView
    }()
    lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    override func viewDidLoad() {
        configureAddSubView()
        configureLayout()
        makeFavoriteView()
        makeFavoriteView()
    }
    func makeFavoriteView(){
        for item in  favoriteItems{
            let backgroundView = UIView()
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.backgroundColor = .systemGray5
            backgroundView.layer.cornerRadius = 10
            backgroundView.clipsToBounds = true
            
            let innerVStackView = UIStackView()
            innerVStackView.axis = .vertical
            innerVStackView.spacing = 10
            innerVStackView.translatesAutoresizingMaskIntoConstraints = false
            
            let firstRowStackView = UIStackView()
            firstRowStackView.axis = .horizontal
            firstRowStackView.distribution = .fillEqually
            firstRowStackView.translatesAutoresizingMaskIntoConstraints = false
            
            let storeNameLabel = UILabel()
            storeNameLabel.text = item.favoriteStoreName
            storeNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
            firstRowStackView.addArrangedSubview(storeNameLabel)
            
            let visitCountLabel = UILabel()
            visitCountLabel.text = "방문 횟수: \(item.visitCount)"
            visitCountLabel.font = UIFont.systemFont(ofSize: 14)
            visitCountLabel.textAlignment = .right
            firstRowStackView.addArrangedSubview(visitCountLabel)
            
            let secondRowStackView = UIStackView()
            secondRowStackView.axis = .horizontal
            secondRowStackView.distribution = .fillEqually
            secondRowStackView.translatesAutoresizingMaskIntoConstraints = false
            
            let locationLabel = UILabel()
            locationLabel.text = item.location
            locationLabel.font = UIFont.systemFont(ofSize: 14)
            secondRowStackView.addArrangedSubview(locationLabel)
            
            let ratingScoreLabel = UILabel()
            ratingScoreLabel.text = "⭐️: \(item.ratingScore)"
            ratingScoreLabel.font = UIFont.systemFont(ofSize: 14)
            ratingScoreLabel.textAlignment = .right
            secondRowStackView.addArrangedSubview(ratingScoreLabel)
            
            innerVStackView.addArrangedSubview(secondRowStackView)
            innerVStackView.addArrangedSubview(firstRowStackView)

            backgroundView.addSubview(innerVStackView)
            
            NSLayoutConstraint.activate([
                innerVStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
                innerVStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
                innerVStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
                innerVStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10)
            ])
            
            vStackView.addArrangedSubview(backgroundView)
        }
    }
    func configureAddSubView(){
        contentView.addSubview(vStackView)
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    }
    func configureLayout(){
        // 여기서 작업할 때만 주석해제
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            vStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            vStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            vStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}

#Preview {
    FavoriteViewController()
}

