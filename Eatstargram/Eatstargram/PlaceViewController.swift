//
//  PlaceViewController.swift
//  Eatstargram
//
//  Created by 강승우 on 2024/08/27.
//

import UIKit

class PlaceViewController : UIViewController {
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "위치"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    lazy var mapImageView: UIImageView = {
        let image = UIImage(named: "map")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupInterface()
        setupLayout()
    }
    
    private func setupInterface() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(mapImageView)
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        mapImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 25),
            titleView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15),
            mapImageView.heightAnchor.constraint(equalToConstant: 250),
            mapImageView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 100),
            mapImageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            mapImageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor)
            ])
    }
}

#Preview {
    PlaceViewController()
}
