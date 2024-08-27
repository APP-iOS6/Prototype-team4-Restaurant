//
//  MapModalViewController.swift
//  Eatstargram
//
//  Created by 강희창 on 8/27/24.
//

import UIKit

class MapModalViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "지도 검색"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.clearsOnBeginEditing = false
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 2.0
        textField.layer.cornerRadius = 5.0
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        
        let magnifyingGlassButton = UIButton(type: .custom)
        magnifyingGlassButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        magnifyingGlassButton.tintColor = .gray // 버튼의 색상 설정
        magnifyingGlassButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30) // 버튼의 크기 설정
        
        // 텍스트 필드에 돋보기 버튼 추가
        textField.rightView = magnifyingGlassButton
        textField.rightViewMode = .always // 버튼이 항상 보이도록 설정
        
        return textField
    }()
    
    private lazy var mapImageView: UIImageView = {   //실제로는 맵뷰로 할 예정
        let imageView = UIImageView()
        imageView.image = UIImage(named: "멋사.png")
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "서울 종로구 종로3길 17 D1동 16층, 17층"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var addButton: UIButton = {
       let button = UIButton()
        button.setTitle("해당 위치로 추가하기", for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        let action = UIAction { _ in
            self.dismiss(animated: true)
        }
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    private lazy var searchStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, searchTextField, mapImageView, addressLabel, addButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillProportionally
        
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
        setUpAutoLayout()
        
    }
    func config() {
        view.backgroundColor = .systemBackground
        view.addSubview(searchStackView)
    }
    
    func setUpAutoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        mapImageView.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            titleLabel.topAnchor.constraint(equalTo: searchStackView.topAnchor, constant: 10),
            searchTextField.heightAnchor.constraint(equalToConstant: 30),
            searchTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            mapImageView.heightAnchor.constraint(equalToConstant: 300),
            mapImageView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            addressLabel.heightAnchor.constraint(equalToConstant: 30),
            addButton.heightAnchor.constraint(equalToConstant: 50),

            searchStackView.heightAnchor.constraint(equalToConstant: 500),
            searchStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            searchStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
            

        ])
    }
    
}

#Preview {
    MapModalViewController()
}
