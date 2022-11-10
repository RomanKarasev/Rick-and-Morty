//
//  MainViewController.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 10.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureTableView()
    }
    
    override func loadView() {
        view = mainView
    }
    private func setView() {
        view.backgroundColor = .systemBackground
        title = "Character"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        mainView.tableView.delegate   = self
        mainView.tableView.dataSource = self
    }
    
    func watchEpisodes(index: IndexPath) {
            print(index)
        }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 152
    }
}


////MARK: - WatchEpisodes
//
//extension MainViewController: WatchEpisodesButton {
//    func WatchEpisodesButtonTapped(index: IndexPath) {
//        watchEpisodes(index: index)
//    }
//}


