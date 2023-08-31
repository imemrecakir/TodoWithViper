//
//  ListViewController.swift
//  TodoWithViper
//
//  Created by Emre Çakır on 27.08.2023.
//

import UIKit
import Kingfisher

final class ListViewController: UIViewController {
    
    private lazy var customNavBarStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, nameLabel, addTodoButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.kf.setImage(with: URL(string: "https://pbs.twimg.com/profile_images/1470166684984131585/6698-uRz_400x400.jpg"), placeholder: UIImage(systemName: "person.fill"))
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .label
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var addTodoButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.buttonSize = .large
        configuration.image = UIImage(systemName: "plus.app")?.withTintColor(.label, renderingMode: .alwaysOriginal)
        configuration.baseBackgroundColor = .clear
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addBarButtonItemTapped), for: .touchUpInside)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
        super.viewWillDisappear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        view.addSubview(tableView)
        view.addSubview(customNavBarStackView)
        
        setNameLabelText(name: "Emre Çakır")
        
        NSLayoutConstraint.activate([
            customNavBarStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavBarStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            customNavBarStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            
            addTodoButton.widthAnchor.constraint(equalToConstant: 40),
            addTodoButton.heightAnchor.constraint(equalToConstant: 40),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: customNavBarStackView.bottomAnchor, constant: 6),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setNameLabelText(name: String) {
        let greetingText = NSAttributedString(string: "Hello,\n",
                                          attributes: [
                                            .font: UIFont.boldSystemFont(ofSize: 15),
                                            .foregroundColor: UIColor.secondaryLabel
                                          ])
        
        let nameText = NSAttributedString(string: name,
                                          attributes: [
                                            .font: UIFont.boldSystemFont(ofSize: 18),
                                            .foregroundColor: UIColor.label
                                          ])
        
        let finalText = NSMutableAttributedString(attributedString: greetingText)
        finalText.append(nameText)
        nameLabel.attributedText = finalText
    }
    
    @objc private func addBarButtonItemTapped() {
        //TODO: Show addViewController.
        print("Add Tapped")
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

