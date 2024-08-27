//
//  ProfileViewController.swift
//  HelloMemoKit
//
//  Created by Soom on 8/27/24.
//

import UIKit

struct Profile{
    let name: String
    let description: String
    let image: String
    static let dummy = Profile(name: "김철수", description: "모든걸 다 먹을거야", image: "nop")
}

class  ProfileViewController: UIViewController{
    
 
    let profile = Profile.dummy
    lazy var profileVStackView: UIStackView = {
        let stack = UIStackView()
        stack.isLayoutMarginsRelativeArrangement = false
        stack.axis = .vertical
        stack.distribution = .fillEqually

       return stack
    }()
    lazy var profileHStackView: UIStackView = {
        let stack = UIStackView()
        stack.isLayoutMarginsRelativeArrangement = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually

       return stack
    }()
    lazy var profileImage: UIImageView = {
        let image = UIImage(named: profile.image)
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
       return imageView
    }()
    lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = profile.name
        label.textAlignment = .center
        return label
    }()
    
    lazy var profileDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = profile.description
        label.textAlignment = .center
        return label
    }()
    override func viewDidLoad() {
        view.backgroundColor = .clear
    }
    func configureLayout(){
        NSLayoutConstraint.activate([
            profileVStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileVStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileVStackView.trailingAnchor.constraint(equalTo:view.trailingAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            profileNameLabel.
        ])
    }
    func configureAddSubView(){
        view.addSubview(profileVStackView)
        profileVStackView.addArrangedSubview(profileNameLabel)
        profileVStackView.addArrangedSubview(profileDescriptionLabel)
    }
}


#Preview {
    ProfileViewController()
}
