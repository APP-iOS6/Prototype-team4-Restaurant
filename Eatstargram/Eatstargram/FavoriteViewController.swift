//
//  FavoriteViewController.swift
//  Eatstargram
//
//  Created by Soom on 8/27/24.
//
import UIKit
struct FavoriteItem{
    let favoriteStoreName: String
    let location: String
    let visitCount: String
    let ratingScore: String
}

class FavoriteViewController: UIViewController {
    let favoriteItems: [FavoriteItem] = Array(repeating: FavoriteItem(favoriteStoreName: "대박 아구찜", location: "은병구 연서로 29길 8-13", visitCount: "22", ratingScore: "4.5"), count: 30)
    lazy var favoriteBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 8
        
        return view
    }()
    lazy var nameLabel: UILabel = {
      let label = UILabel()
        label.text = "asdfasdfa"
        return label
    }()
    lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    lazy var hStackView: UIStackView = {
      let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.backgroundColor = .brown
        return stack
    }()
    lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.backgroundColor = .blue
        return stack
    }()
    override func viewDidLoad() {
        configureAddSubView()
        configureLayout()
    }
    func configureAddSubView(){
        view.addSubview(favoriteBackgroundView)
        favoriteBackgroundView.addSubview(hStackView)
    }
    func configureLayout(){
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            hStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            hStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            hStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    func makeFavoriteView(){
    }
}

#Preview {
    FavoriteViewController()
}

