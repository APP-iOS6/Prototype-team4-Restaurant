//
//  menuViewController.swift
//  Eatstargram
//
//  Created by 강승우 on 2024/08/27.
//

import UIKit

class MenuViewController : UIViewController, UITableViewDataSource, UITableViewDelegate {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var titleView: UILabel = {
        let label = UILabel()
        label.text = "메뉴"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        return label
    }()
    
    private lazy var menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.dataSource = self
        tableView.delegate = self
        
        // 메모리의 효율적 관리를 위해
        // TableView가 사용할 Cell의 재활용 선언
        tableView.register(MenuCell.self, forCellReuseIdentifier: "MenuCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        setupInterface()
        setupLayout()
    }
    
    private func setupInterface() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(menuTableView)
        
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        titleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            titleView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 50),
            titleView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 15)
            ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MenuCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCell
        
        let menu: Menu = menus[indexPath.row]
        
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal

        let result: String = numberFormatter.string(for: menu.price)!
        
        cell.nameLabel.text = menu.name
        cell.priceLabel.text = "\(result) 원"
        return cell
    }
}


#Preview {
    MenuViewController()
}
