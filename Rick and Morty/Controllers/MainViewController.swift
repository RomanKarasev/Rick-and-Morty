//
//  MainViewController.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 10.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let mainView = MainView()
    var maxCountOfPage: Int?
    var countOfCharacter = 0
    let cell = MainTableViewCell()
    var results = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureTableView()
        setCharacter()
    }
    
    func setCharacter() {
        CharacterManager.getMainCharacter { characterData in
            self.maxCountOfPage = characterData.info.pages
            self.results = characterData.results
            guard let countOfPage = self.maxCountOfPage else { return }
            for page in 2...countOfPage {
                CharacterManager.getCharacterFrom(page: page, completion: { characterData in
                    self.countOfCharacter += characterData.results.count
                    self.results += characterData.results
                    DispatchQueue.main.async {
                        self.mainView.tableView.reloadData()
                    }
                })
            }
        }
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
    
    //    func watchEpisodes(index: IndexPath) {
    //            print(index)
    //        }
    
}

//MARK: - UITableViewDelegate, UITableViewDataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        countOfCharacter
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.render(from: ViewModel(from: results, index: indexPath))
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


