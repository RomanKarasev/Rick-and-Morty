//
//  MainViewController.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 10.11.2022.
//

import UIKit


//MARK: - MainViewController

final class MainViewController: UIViewController {
    
    // MARK: Properties
    
    let mainView         = MainView()
    var maxCountOfPage   : Int?
    var countOfCharacter = 0
    var results          = [Result]()
    let cell             = MainTableViewCell()
    
    
    // MARK: View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureTableView()
        setCharacter()
    }
    
    override func loadView() {
        view = mainView
    }
    
    // MARK: Methods
    
    private func setView() {
        view.backgroundColor = .systemBackground
        title = "Character"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setCharacter() {
#warning("Настроить скорость отображение чб изображения")
        CharacterManager.getMainCharacter { characterData in
            self.maxCountOfPage     = characterData.info.pages
            self.results            = characterData.results
            guard let countOfPage   = self.maxCountOfPage else { return }
            for page in 2...countOfPage {
                CharacterManager.getCharacterFrom(page: page, completion: { characterData in
                    self.countOfCharacter   += characterData.results.count
                    self.results            += characterData.results
                    DispatchQueue.main.async {
                        self.mainView.tableView.reloadData()
                    }
                }
                )
            }
        }
    }
    
    private func configureTableView() {
        mainView.tableView.delegate   = self
        mainView.tableView.dataSource = self
    }
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
        return Constants.CGFloafs.heightForRow
    }
}
