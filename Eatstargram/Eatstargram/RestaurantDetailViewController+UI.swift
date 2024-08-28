import UIKit

class ActionButton: UIButton {
    var action: (() -> Void)?
    
    @objc func triggerAction() {
        action?()
    }
}

extension RestaurantDetailViewController {
    func createScrollView() -> UIScrollView {
        let view = UIScrollView()
        return view
    }
    
    func createWidthDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = .black
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }
    
    func createStackView(axis: NSLayoutConstraint.Axis, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = axis
        stackView.spacing = spacing
        return stackView
    }
    
    func createLabel(text: String, fontSize: CGFloat = 16) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: fontSize)
        return label
    }
    
    func createImageView(_ imageName: String) -> UIImageView {
        let image = UIImage(systemName: imageName)
        let imageView = UIImageView(image: image)
        imageView.tintColor = .gray
        return imageView
    }
    
    func createCompleteStar() -> UIImageView {
        let image = UIImage(systemName: "star.fill")
        let view = UIImageView(image: image)
        view.tintColor = UIColor(red: 233/255, green: 232/255, blue: 40/255, alpha: 1)
        return view
    }
    
    func createHalfStar() -> UIImageView {
        let image = UIImage(systemName: "star.leadinghalf.filled")
        let view = UIImageView(image: image)
        return view
    }
    
    func createEmptyStar() -> UIImageView {
        let image = UIImage(systemName: "star.fill")
        let view = UIImageView(image: image)
        view.tintColor = .gray
        return view
    }
    
    func createButtonView(_ title : String, action : @escaping () -> Void) -> UIView {
        let menuStackView = UIStackView()
        menuStackView.axis = .vertical
        menuStackView.alignment = .center
        menuStackView.distribution = .fillEqually
        menuStackView.layer.borderColor = UIColor.black.cgColor
        menuStackView.layer.borderWidth = 1
        menuStackView.layer.cornerRadius = 10
        
        let menuTitleLabel = createLabel(text: title, fontSize: 24)
        
        menuStackView.addArrangedSubview(menuTitleLabel)
        
        let menuButtonView = ActionButton()
        menuButtonView.action = action
        menuButtonView.addTarget(menuButtonView, action: #selector(menuButtonView.triggerAction), for: .touchUpInside)
        menuStackView.addSubview(menuButtonView)
        
        menuButtonView.translatesAutoresizingMaskIntoConstraints = false
        menuStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuButtonView.topAnchor.constraint(equalTo : menuStackView.topAnchor),
            menuButtonView.bottomAnchor.constraint(equalTo : menuStackView.bottomAnchor),
            menuButtonView.leadingAnchor.constraint(equalTo: menuStackView.leadingAnchor),
            menuButtonView.trailingAnchor.constraint(equalTo: menuStackView.trailingAnchor),
        ])
        
        return menuStackView
    }
    
    
    func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        headStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            imageView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            headStackView.heightAnchor.constraint(equalToConstant: 35),
            headStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            headStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15),
            buttonStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -15),
            buttonStackView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor)
        ])
    }
}
