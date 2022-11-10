//
//  MainView.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 10.11.2022.
//

import UIKit

//MARK: - MainView

class MainView: UIView {
    
    // MARK: Properties
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.bounces = false
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    
    private func setConstraints() {
        
        addSubview(tableView)
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: topAnchor, constant: 90),
                                     tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
                                     tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
