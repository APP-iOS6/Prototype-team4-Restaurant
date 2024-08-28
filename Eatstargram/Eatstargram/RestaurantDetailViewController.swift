import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var isLike: Bool = false
    
    lazy var scrollView: UIScrollView = createScrollView()
    
    lazy var stackView: UIStackView = createStackView(axis: .vertical, spacing: 15)
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image1"))
        return imageView
    }()
    
    lazy var nameLabel: UILabel = createLabel(text: "대박아구찜", fontSize: 24)
    lazy var rateLabel: UILabel = createLabel(text: "평점 : 4.7")
    
    lazy var detailInfoStack: UIStackView = createStackView(axis: .vertical, spacing: 10)
    
    lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        likeButton.setImage(UIImage(systemName: isLike ? "heart.fill" : "heart"), for: .normal)
        likeButton.tintColor = .red
        likeButton.addTarget(self, action: #selector(clickLikeButton), for: .touchUpInside)
        return likeButton
    }()
    
    lazy var headStackView: UIStackView = {
        let headStackView = UIStackView(arrangedSubviews: [nameLabel, rateLabel, likeButton])
        headStackView.axis = .horizontal
        headStackView.spacing = 10
        return headStackView
    }()
    
    lazy var buttonStackView: UIStackView = {
        let separator = UIView()
        separator.backgroundColor = .black
        
        
        let buttonStackView = UIStackView(arrangedSubviews: [
            createButtonView("메뉴 보기", action: clickMenuButton)
        ])
        buttonStackView.spacing = 0
        
        NSLayoutConstraint.activate([
            separator.widthAnchor.constraint(equalToConstant: 0.1),
            separator.heightAnchor.constraint(equalToConstant:60)
        ])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .equalCentering
        
        return buttonStackView
    }()
    
    private lazy var reviewTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        
        // 메모리의 효율적 관리를 위해
        // TableView가 사용할 Cell의 재활용 선언
        tableView.register(ReviewCell.self, forCellReuseIdentifier: "ReviewCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupInterface()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reviewTableView.reloadData()
    }
    
    private func setupInterface() {
       
        for i in 0..<infos.count {
            let infoStack = createStackView(axis: .horizontal, spacing: 10)
            let imageView = createImageView(infos[i].image)
            let contentView = createLabel(text: infos[i].content, fontSize: 14)
            
            infoStack.addArrangedSubview(imageView)
            infoStack.addArrangedSubview(contentView)
            detailInfoStack.addArrangedSubview(infoStack)
            
            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor, constant: 10),
                imageView.trailingAnchor.constraint(equalTo: infoStack.leadingAnchor, constant: 35),
                contentView.leadingAnchor.constraint(equalTo: infoStack.leadingAnchor, constant: 45),
                contentView.trailingAnchor.constraint(equalTo: infoStack.trailingAnchor)
            ])
        }
        
        view.addSubview(stackView)
    
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(headStackView)
        stackView.addArrangedSubview(detailInfoStack)
        stackView.addArrangedSubview(buttonStackView)
        stackView.addArrangedSubview(reviewTableView)
    }
    
    private func setupLayout() {
        setupStackViewConstraints()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ReviewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        
        
        let review: Review = reviews[indexPath.row]
        
        cell.nameLabel.text = "\(review.name)"
        cell.reviewCntLabel.text = "리뷰 \(review.reviewCnt)"
        cell.avgRateLabel.text = "평균별점 \(review.avgRate)"
        cell.visitLabel.text = "방문횟수 \(review.visitCnt)회"
        
        var cnt = Int(review.point)
        
        cell.reviewRateView.subviews.forEach { $0.removeFromSuperview() }
        
        if Double(cnt) < review.point {
            cnt += 1
        }
        
        for _ in 0..<cnt {
            cell.reviewRateView.addArrangedSubview(createCompleteStar())
        }
        
        if 5-cnt > 0 {
            for _ in 0..<5-cnt {
                cell.reviewRateView.addArrangedSubview(createEmptyStar())
            }
        }
        
        cell.reviewImageView.image = review.image
        cell.reviewImageView.layer.opacity = 0.95
        cell.reviewContentLabel.text = review.content
        return cell
    }
    
}

extension RestaurantDetailViewController {
    @objc func clickLikeButton() {
        isLike.toggle()
        likeButton.setImage(UIImage(systemName: isLike ? "heart.fill" : "heart"), for: .normal)
        
        let NotificationView = NotificationViewController()
        self.present(NotificationView, animated: true)
        NotificationView.modalPresentationStyle = .fullScreen
    }
    
    func clickMenuButton() {
        let viewController = MenuViewController()
        viewController.sheetPresentationController?.detents = [.medium(), .large()]
        viewController.sheetPresentationController?.prefersGrabberVisible = true
        
        self.present(viewController, animated: true)
    }
    
    @objc func clickPlaceButton() {
        let viewController = PlaceViewController()
        viewController.sheetPresentationController?.detents = [.medium()]
        viewController.sheetPresentationController?.prefersGrabberVisible = true
        
        self.present(viewController, animated: true)
    }
}

#Preview {
    RestaurantDetailViewController()
}
