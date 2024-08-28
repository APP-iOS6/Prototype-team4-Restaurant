import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var isLike: Bool = false
    
    lazy var stackView: UIStackView = createStackView(axis: .vertical, spacing: 10)
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "image1"))
        return imageView
    }()
    
    lazy var nameLabel: UILabel = createLabel(text: "대박아구찜", fontSize: 24)
    lazy var rateLabel: UILabel = createLabel(text: "평점 : 4.7")
    
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
            createButtonView("메뉴", "아구찜 36,000원", action: clickMenuButton),
            separator,
            createButtonView("위치", "연서로 29길", action: clickPlaceButton)
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
        let divider1 = createWidthDivider()
        let divider2 = createWidthDivider()
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(headStackView)
        stackView.addArrangedSubview(divider1)
        stackView.addArrangedSubview(buttonStackView)
        stackView.addArrangedSubview(divider2)
        stackView.addArrangedSubview(reviewTableView)
        
        NSLayoutConstraint.activate([
            divider1.heightAnchor.constraint(equalToConstant: 0.3),
            divider1.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            divider1.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            divider2.heightAnchor.constraint(equalToConstant: 0.3),
            divider2.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            divider2.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
        ])
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
        
        cell.nameLabel.text = "닉네임 : \(review.name)"
        cell.visitLabel.text = "방문 횟수 : \(review.visitCnt)회"
        
        var cnt = Int(review.point)
        
        cell.reviewRateView.subviews.forEach { $0.removeFromSuperview() }
        
        for _ in 0..<cnt {
            cell.reviewRateView.addArrangedSubview(createCompleteStar())
        }
        
        if Double(cnt) < review.point {
            cell.reviewRateView.addArrangedSubview(createHalfStar())
            cnt += 1
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
