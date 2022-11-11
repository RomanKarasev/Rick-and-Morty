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
        let tableView                                       = UITableView()
        tableView.bounces                                   = false
        tableView.backgroundColor                           = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.separatorStyle                            = .none
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
    
    
    // MARK: setConstraints
    private func setConstraints() {
        
        addSubview(tableView)
        NSLayoutConstraint.activate(
            [tableView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.CGFloafs.Constraints.tableView.topAncor),
             tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.CGFloafs.Constraints.tableView.leadingAncor),
             tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.CGFloafs.Constraints.tableView.trailingAnchor),
             tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ]
        )
    }
}
