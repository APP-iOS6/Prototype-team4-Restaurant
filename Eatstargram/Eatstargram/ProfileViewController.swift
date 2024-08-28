//
//  ProfileViewController.swift
//  HelloMemoKit
//
//  Created by Soom on 8/27/24.
//

import UIKit

class  ProfileViewController: UIViewController{
    let profile = Profile.dummy
    let categoryViewController = CategoryViewController()
    let favoriteViewController = FavoriteViewController()
    
    lazy var profileVStackView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually

       return stack
    }()
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.tintColor = .black
        
        return button
    }()
    
    lazy var profileVStackView0: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually

       return stack
    }()
    lazy var profileHStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false

       return stack
    }()
    lazy var profileImage: UIImageView = {
        var image = UIImage(systemName: "person.circle")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
       return imageView
    }()
    lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = profile.name
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .right
        return label
    }()
    
    lazy var profileName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이름:"
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .left
        return label
    }()
    
    lazy var profileDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "소개:"
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .left
        return label
    }()
    lazy var profileDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = profile.description
        label.font = .preferredFont(forTextStyle: .title2)
        label.textAlignment = .right
        return label
    }()
    lazy var itemViewHStack: UIStackView = {
        let stackH = UIStackView()
        stackH.axis = .horizontal
        stackH.spacing = 20
        stackH.distribution = .fillEqually
        stackH.translatesAutoresizingMaskIntoConstraints =  false
        
        return stackH
    }()
    lazy var itemViewVStack: UIStackView = {
        let stackV = UIStackView()
        stackV.axis = .vertical
        stackV.spacing = 5
        stackV.distribution = .fillEqually
        stackV.translatesAutoresizingMaskIntoConstraints = false
        return stackV
    }()
    lazy var IconInfoHstack: UIStackView = {
       let hStack = UIStackView()
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        hStack.spacing = 50
        
        return hStack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureAddSubView()
        makeIconInfo()
        configureLayout()
    }
    func configureLayout(){
        NSLayoutConstraint.activate([
            editButton.bottomAnchor.constraint(equalTo: profileHStackView.topAnchor, constant: 20),
            editButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 330),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            editButton.heightAnchor.constraint(equalToConstant: 50),
            // 이름, 소개 레이아웃
            
            profileHStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            profileHStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileHStackView.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -20),
            profileHStackView.heightAnchor.constraint(equalToConstant: 100),
            
            

           // 카테고리 레이아웃..
            categoryViewController.hStackView.topAnchor.constraint(equalTo: profileHStackView.bottomAnchor, constant: 30),
            categoryViewController.hStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            categoryViewController.hStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            categoryViewController.hStackView.heightAnchor.constraint(equalToConstant: 80),
            
           // 좋아요 리스트 레이아웃
            favoriteViewController.scrollView.topAnchor.constraint(equalTo: categoryViewController.hStackView.bottomAnchor, constant: 50),
            favoriteViewController.scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            favoriteViewController.scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            favoriteViewController.scrollView.heightAnchor.constraint(equalToConstant: 500)
        ])
    }
    func configureAddSubView(){
        view.addSubview(profileHStackView)
        view.addSubview(editButton)
        view.addSubview(IconInfoHstack)
        profileHStackView.addArrangedSubview(profileImage)
        profileHStackView.addArrangedSubview(profileVStackView0)
        profileHStackView.addArrangedSubview(profileVStackView)
        
        profileVStackView0.addArrangedSubview(profileName)
        profileVStackView0.addArrangedSubview(profileDescription)
        
        profileVStackView.addArrangedSubview(profileNameLabel)
        profileVStackView.addArrangedSubview(profileDescriptionLabel)
        
        self.addChild(categoryViewController)
        self.view.addSubview(categoryViewController.view)
        
        self.addChild(favoriteViewController)
        self.view.addSubview(favoriteViewController.view)
        
    }
    func makeIconInfo(){
        let iconInfoList: [String] = ["🚪: 방문횟수", "⭐️: 평균 별점"]
        for i in iconInfoList{
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = i
            label.font = .preferredFont(forTextStyle: .subheadline)
            
            NSLayoutConstraint.activate([
                IconInfoHstack.topAnchor.constraint(equalTo: categoryViewController.hStackView.bottomAnchor),
                IconInfoHstack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                IconInfoVstack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//                IconInfoVstack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                IconInfoHstack.heightAnchor.constraint(equalToConstant: 50)
            ])
            IconInfoHstack.addArrangedSubview(label)
        }
    }
}


#Preview {
    ProfileViewController()
}
