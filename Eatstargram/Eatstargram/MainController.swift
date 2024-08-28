//
//  MainController.swift
//  Eatstargram
//
//  Created by 박준영 on 8/27/24.
//

import UIKit

class MainController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 상단에 보이는 옵션 버튼들
    private func categoriButton(title: String) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle(title, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 85),
        ])
        
        button.addAction(UIAction { _ in
            if let buttonTitle = button.title(for: .normal) {
                print("\(buttonTitle)")
                self.updateView(name: buttonTitle)
                self.buttonTapped(button)
            }
        }, for: .touchUpInside)
        
        return button
    }

    func updateView(name: String) {
        switch name {
        case "평점" :
            let StarViewController = ChoiceStarViewController()
            self.present(StarViewController, animated: true)
            // StarViewController.modalPresentationStyle = .formSheet
            // StarViewController.sheetPresentationController?.detents = [.medium()]
            if let sheet = StarViewController.sheetPresentationController {
                sheet.detents = [
                    .custom { _ in
                        return 300
                    }
                ]
            }
            
            StarViewController.choiceClosure = { selectedValue in
                self.foodList = foods.filter { $0.star == "\(selectedValue)" }
                self.foodCollectionView.reloadData()
            }
        case "지역" :
            let AreaViewController = ChoiceAreaViewController()
            self.present(AreaViewController, animated: true)
            // StarViewController.modalPresentationStyle = .formSheet
            AreaViewController.sheetPresentationController?.detents = [.large(), .medium()]
            
            AreaViewController.choiceClosure = { selectedValue in
                self.foodList = foods.filter { $0.location.rawValue == "\(selectedValue)" }
                self.foodCollectionView.reloadData()
            }
        case "음식" :
            let FoodViewController = ChoiceFoodViewController()
            self.present(FoodViewController, animated: true)
            // StarViewController.modalPresentationStyle = .formSheet
            FoodViewController.sheetPresentationController?.detents = [.large(), .medium()]
            
            FoodViewController.choiceClosure = { selectedValue in
                self.foodList = foods.filter { $0.foodname.rawValue == "\(selectedValue)" }
                self.foodCollectionView.reloadData()
            }
        default :
            self.foodList = foods.shuffled() // "전체" 버튼을 클릭시, 전체 리스트를 섞어서 출력
            self.foodCollectionView.reloadData()
        }
    }
    
    
    
    // 버튼 클릭 시 색상 변경 로직
    private func buttonTapped(_ selectedButton: UIButton) {
        // 모든 버튼을 회색으로 설정
        buttonStack.arrangedSubviews.forEach { view in
            if let button = view as? UIButton {
                button.backgroundColor = .gray
            }
        }
        // 클릭된 버튼을 파란색으로 설정
        selectedButton.backgroundColor = .blue
    }
    
    // 카테고리 버튼을 스택으로 묶음
    private lazy var buttonStack: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 10
        buttonStackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        buttonStackView.isLayoutMarginsRelativeArrangement = true
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonStackView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
        return stackView
    }()
    
    private lazy var titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .left
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleSearch: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLocation: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "location"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleMiniStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        // StackView의 양쪽 여백 설정
            stackView.isLayoutMarginsRelativeArrangement = true
            stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        return stackView
    }()
    
    private let categoris = ["전체", "평점", "지역", "음식"]  
    var foodList: [Food] = []
    
    private lazy var foodCollectionView: UICollectionView = {
        // UICollectionView의 레이아웃 설정
        let layout = UICollectionViewFlowLayout()
        
        // 셀 간의 가로, 세로 간격을 0으로 설정
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 2
            
            // 셀 사이의 여백을 없애기 위해 섹션 인셋을 0으로 설정
            layout.sectionInset = .zero
            
            // 셀 크기 설정 (예시로 정사각형 셀로 설정)
            layout.itemSize = CGSize(width: 130, height: 125)
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.dataSource = self
            collectionView.delegate = self
            collectionView.backgroundColor = .white
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            
            collectionView.register(MyCell.self, forCellWithReuseIdentifier: "MyCell")
            
            return collectionView
    }()
    
    // MARK: - UICollectionViewDelegate
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // cell의 재활용
        let cell: MyCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        
        let imageURL = foodList[indexPath.row].image
        
        // 이미지 받아오기
        Task{
            do {
                let urlImage = try await UIImage.fetchImage(from: imageURL)
                DispatchQueue.main.async {
                    cell.label.image = urlImage
                }
            }
        }
        
        return cell
    }
    
    // cell을 선택할 때 처리
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let DetailViewController = RestaurantDetailViewController()
        self.navigationController?.pushViewController(DetailViewController, animated: true)

    }

class MyCell: UICollectionViewCell {
    let label: UIImageView
    
    override init(frame: CGRect) {
        
        label = UIImageView()
        
        super.init(frame: frame)
        
        label.frame = contentView.bounds
        contentView.addSubview(label)
        
        contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    
    private lazy var foodCollectionStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupInterface()
        foodList = foods.shuffled()
        foodCollectionView.reloadData()
    }
    
    func setupInterface() {
        view.addSubview(mainStackView)
        
        // 버튼을 스택 뷰에 추가합니다.
        for context in categoris {
            let button = categoriButton(title: context)
            buttonStack.addArrangedSubview(button)
        }
        
        foodCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        titleMiniStackView.addArrangedSubview(titleSearch)
        titleMiniStackView.addArrangedSubview(titleLocation)
        
        titleStackView.addArrangedSubview(titleImageView)
        titleStackView.addArrangedSubview(titleMiniStackView)
        
        foodCollectionStack.addArrangedSubview(foodCollectionView)
        
        mainStackView.addArrangedSubview(titleStackView)
        mainStackView.addArrangedSubview(buttonStack)
        mainStackView.addArrangedSubview(foodCollectionStack)
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            foodCollectionStack.widthAnchor.constraint(equalToConstant: view.frame.width),
            foodCollectionStack.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -50)
        ])
    }
}

#Preview {
    MainController()
}

