//
//  NotificationViewController.swift
//  Eatstargram
//
//  Created by 박준영 on 8/28/24.
//

import UIKit

class NotificationViewController: UIViewController {

    // UIImageView를 lazy로 초기화
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit // 이미지를 비율에 맞게 조절
        imageView.image = UIImage(named: "Notification")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // 배경색을 흰색으로 설정
        
        setupImageView()
    }
    
    private func setupImageView() {
        // 이미지 뷰를 메인 뷰에 추가
        view.addSubview(imageView)
        
        // Auto Layout을 사용하여 이미지 뷰의 위치와 크기 설정
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width), // 원하는 너비로 설정
            imageView.heightAnchor.constraint(equalToConstant: view.frame.height) // 원하는 높이로 설정
        ])
    }
}
