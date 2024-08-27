//
//  CategoryViewController.swift
//  Eatstargram
//
//  Created by Soom on 8/27/24.
//

import UIKit

class CategoryViewController: UIViewController {
    let itemList: [String] = ["리뷰", "좋아요", "평균 평점"]
    let itemCount: [Float] = [32, 2, 4.5]
    lazy var hStackView: UIStackView = {
        let hStackView = UIStackView()
        hStackView.axis = .horizontal
        hStackView.distribution = .fillEqually
        hStackView.spacing = 10
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return hStackView
    }()
    override func viewDidLoad() {
        makeCategoryBackground()
        configureLayout()
    }
    func configureLayout(){
        view.addSubview(hStackView)
    }
    func makeCategoryBackground(){
        for index in 0..<itemList.count {
            let backgroundView = UIView()
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            backgroundView.backgroundColor = .white
            backgroundView.layer.borderWidth = 1
            backgroundView.layer.cornerRadius = 10
            backgroundView.clipsToBounds = true
            
            hStackView.addArrangedSubview(backgroundView)

            let vStackView = UIStackView()
            vStackView.axis = .vertical
            vStackView.distribution = .fillEqually
            vStackView.spacing = 0
            vStackView.translatesAutoresizingMaskIntoConstraints = false
            
            let categoryName = UILabel()
            categoryName.text = itemList[index]
            categoryName.textAlignment = .center
            categoryName.font = .preferredFont(forTextStyle: .callout)
            vStackView.addArrangedSubview(categoryName)
            
            let categoryCount = UILabel()
            categoryCount.text = String(itemCount[index])
            categoryCount.textAlignment = .center
            categoryCount.font = .preferredFont(forTextStyle: .title3)
            vStackView.addArrangedSubview(categoryCount)
            
            backgroundView.addSubview(vStackView)
            
            NSLayoutConstraint.activate([
                vStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
                vStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -10),
                vStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
                vStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10)
            ])
        }
    }
}


#Preview {
    CategoryViewController()
}
