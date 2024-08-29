//
//  ViewController.swift
//  AddView
//
//  Created by 강희창 on 8/27/24.
//

import UIKit
import Photos

class AddViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    // MARK: - title Stack
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "식당 등록"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    private var certifiButton: UIButton = {
        let button = UIButton(type: .custom)
        
        var config = UIButton.Configuration.filled()
        
        config.title = "영수증 인증"
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.cornerStyle = .medium // 버튼의 코너 스타일
        config.imagePadding = 15 // 텍스트와 이미지 사이의 간격
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16) // 패딩 설정
        
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        button.configuration = config
        button.addAction(UIAction { [weak button] _ in
            guard let button = button else { return }
            
            // 버튼의 상태 변경
            let isChecked = button.tag == 0
            button.tag = isChecked ? 1 : 0
            
            // 상태에 따른 UI 업데이트
            if isChecked {
                let checkmarkImage = UIImage(systemName: "checkmark")
                button.configuration?.image = checkmarkImage
                button.configuration?.baseForegroundColor = .white
            } else {
                button.configuration?.image = nil
            }
        }, for: .touchUpInside)
        
        
        return button
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, certifiButton])
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        
        return stackView
    }()
    // MARK: - TextFiedl Stack
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이 름 :"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textColor = .black
        textField.clearButtonMode = .whileEditing
        textField.clearsOnBeginEditing = false
        
        return textField
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        return stackView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "장 소 :"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        
        return label
    }()
    
    private lazy var locationTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.textColor = .black
        textField.clearButtonMode = .whileEditing
        textField.clearsOnBeginEditing = false
        
        return textField
    }()
    
    private lazy var locationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationLabel, locationTextField])
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameStackView, locationStackView])
        stackView.spacing = 18
        stackView.axis = .vertical
        stackView.distribution = .fill
        
        
        
        return stackView
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.setTitle("현 위치", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        let action = UIAction { [weak self] _ in
               
            self?.locationTextField.text = "서울특별시"
           }
           
           button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    private lazy var mapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.setTitle("지도 검색", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        let action = UIAction { _ in
            let mapVC = MapModalViewController()
            mapVC.modalPresentationStyle = .pageSheet
            
            
            if let sheet = mapVC.sheetPresentationController {
                sheet.detents = [
                    .custom { _ in
                        return UIScreen.main.bounds.height * 0.7
                    }
                ]
            }
            self.present(mapVC, animated: true, completion: nil)
        }
        
        
        button.addAction(action, for: .touchUpInside)
        return button
    }()
    
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationButton, mapButton])
        stackView.spacing = 10
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        
        
        return stackView
    }()
    // MARK: - 이미지 스택
    private let imageLabel: UILabel = {
        let label = UILabel()
        label.text = "이미지"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "이미지가 없습니다."
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
        
    }()
    
    private lazy var addimageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImageView))
                imageView.addGestureRecognizer(tapGesture)
        
        
        return imageView
    }()
    
    private lazy var addImageButton: UIButton = {
        let button = UIButton(type: .custom)
//        button.backgroundColor = .systemBlue
//        button.setTitle("이미지 추가", for: .normal)
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .clear
           config.baseForegroundColor = .systemBlue
           config.cornerStyle = .medium
           
           // 플러스 아이콘 설정 및 크기 조정
           let plusImage = UIImage(systemName: "plus.square.on.square")?
               .withConfiguration(UIImage.SymbolConfiguration(pointSize: 30, weight: .bold))
           config.image = plusImage
           config.imagePadding = 8 // 이미지와 버튼의 경계 간격
           
           // 버튼에 구성 적용
           button.configuration = config
           button.layer.cornerRadius = 25
        
        return button
    }()
    
    // MARK: - 갤러리 접근
    //Privacy - Camera Usage Description로 접근허용은 아직 구현하지 않았음.
    private lazy var imagePickerController: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        return picker
    }()
    private lazy var addImageAction: UIAction = UIAction { [weak self] _ in
        self?.present(self!.imagePickerController, animated: true)
        //        print("aa")
    }
    
    private lazy var imageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageLabel, addimageView])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
    }()
    
    // MARK: - 소개글 Stack
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "소개글"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    private lazy var infoTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .lightGray
        return textView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [infoLabel, infoTextView])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private var registerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .systemBlue
        button.setTitle("등 록", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        //등록 버튼을 누르면 dimiss
        //        button.addAction(UIAction { [weak button] _ in
        //             if let viewController = button?.superview?.next as? UIViewController {
        //                 viewController.dismiss(animated: true, completion: nil)
        //             }
        //         }, for: .touchUpInside)
        
        return button
    }()
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        setUpAutoLayout()
        
    }
    
    
    private func configure() {
        view.backgroundColor = .systemBackground
        
        [titleStackView, topStackView, buttonStackView, imageStackView, infoStackView, registerButton].forEach { scrollView.addSubview($0) }
        view.addSubview(scrollView)
        addimageView.addSubview(emptyLabel)
        addimageView.addSubview(addImageButton)
        
        
        addImageButton.addAction(addImageAction, for: .touchUpInside)
        
    }
    @objc private func didTapImageView() {
            present(imagePickerController, animated: true)
        }
    
    // MARK: - AutoLayOut
    
    private func setUpAutoLayout() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        addimageView.translatesAutoresizingMaskIntoConstraints = false
        emptyLabel.translatesAutoresizingMaskIntoConstraints = false
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        infoTextView.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.widthAnchor.constraint(equalToConstant: view.frame.width),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
        ])
        
        NSLayoutConstraint.activate([
            titleStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            titleStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            titleStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            titleStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
        ])
        NSLayoutConstraint.activate([
            nameTextField.widthAnchor.constraint(equalToConstant: 270),
            locationTextField.widthAnchor.constraint(equalToConstant: 270),
            topStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 30),
            topStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            topStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.widthAnchor.constraint(equalToConstant: 200),
            buttonStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            addimageView.heightAnchor.constraint(equalToConstant: 180),
            emptyLabel.topAnchor.constraint(equalTo: addimageView.topAnchor, constant: 30),
            emptyLabel.widthAnchor.constraint(equalTo: addimageView.widthAnchor),
            addImageButton.centerXAnchor.constraint(equalTo: addimageView.centerXAnchor),
            addImageButton.centerYAnchor.constraint(equalTo: addimageView.centerYAnchor),
            
            imageStackView.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 50),
            imageStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            imageStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            infoTextView.heightAnchor.constraint(equalToConstant: 150),
            infoStackView.topAnchor.constraint(equalTo: imageStackView.bottomAnchor, constant: 20),
            infoStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            infoStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            registerButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 80),
            registerButton.topAnchor.constraint(equalTo: infoStackView.bottomAnchor, constant: 10)
        ])
        scrollView.contentSize = CGSize(
            width: scrollView.frame.width,
            height: scrollView.frame.height
        )
    }
}
// MARK: - Extension

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            addimageView.image = selectedImage
            emptyLabel.isHidden = true // 이미지가 설정되면 emptyLabel 숨기기
            addImageButton.isHidden = true

        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

#Preview {
    AddViewController()
}
