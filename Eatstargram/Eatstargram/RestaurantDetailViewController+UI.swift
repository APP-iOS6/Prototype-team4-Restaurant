import UIKit

class ActionButton: UIButton {
    var action: (() -> Void)?
    
    @objc func triggerAction() {
        action?()
    }
}

extension RestaurantDetailViewController {
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
    
    func createCompleteStar() -> UIImageView {
        let image = UIImage(systemName: "star.fill")
        let view = UIImageView(image: image)
        return view
    }
    
    func createHalfStar() -> UIImageView {
        let image = UIImage(systemName: "star.leadinghalf.filled")
        let view = UIImageView(image: image)
        return view
    }
    
    func createEmptyStar() -> UIImageView {
        let image = UIImage(systemName: "star")
        let view = UIImageView(image: image)
        return view
    }
    
    func createButtonView(_ title : String, _ content : String, action : @escaping () -> Void) -> UIView {
        let menuStackView = UIStackView()
        menuStackView.axis = .vertical
        menuStackView.alignment = .center
        menuStackView.distribution = .fillEqually
        
        let menuTitleLabel = createLabel(text: title, fontSize: 24)
        let menuLabel = createLabel(text: content)
        
        menuStackView.addArrangedSubview(menuTitleLabel)
        menuStackView.addArrangedSubview(menuLabel)
        
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
            menuStackView.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        return menuStackView
    }
    
    func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        headStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            imageView.heightAnchor.constraint(equalToConstant: 260),
            
            headStackView.heightAnchor.constraint(equalToConstant: 35),
            headStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 20),
            headStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -30),
            
            buttonStackView.heightAnchor.constraint(equalToConstant: 100),
            buttonStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 5),
            buttonStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -5),
        ])
    }
}
