//
//  MainTableViewCell.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 10.11.2022.
//

////MARK: - Protocol
//
//protocol WatchEpisodesButton: AnyObject {
//    func WatchEpisodesButtonTapped(index: IndexPath)
//}

import UIKit
//import SDWebImage

// MARK: - MainTableViewCell

class MainTableViewCell: UITableViewCell {
    
    //MARK: Properties
    
    static let identifier = "MenuTableViewCell"
    //
    //    weak var delegate: WatchEpisodesButton?
    //    var index: IndexPath?
    //
    
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "default")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let characterTitleLabel = UILabel(text: "Rick",
                                      font: .systemFont(ofSize: 21),
                                      alignment: .left,
                                      textColor: .label)
    
    let characterDescription = UILabel(text: "Человек, мужик",
                                       font: .systemFont(ofSize: 14),
                                       alignment: .left,
                                       textColor: .label)
    
    let characterStatus: UILabel = {
        let label = UILabel(text: "ALIVE",
                            font: .systemFont(ofSize: 14),
                            alignment: .center,
                            textColor: .label)
        label.backgroundColor = .green
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 25 / 2
        return label
    }()
    
    let watchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 17
        button.backgroundColor = .red
        return button
    }()
    
    let watchLabel = UILabel(text: "Watch episodes",
                             font: .systemFont(ofSize: 14),
                             alignment: .left,
                             textColor: .orange)
    
    let watchImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 12))
        imageView.image = UIImage(named: "play")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let watchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let placeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    let placeLabel = UILabel(text: "Earth (C-500A)",
                             font: .systemFont(ofSize: 14),
                             alignment: .left,
                             textColor: .label)
    
    let placeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "map"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        selectionStyle = .none
        
        //        watchButton.addTarget(self, action: #selector(watchButtonTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    
    //    @objc func watchButtonTapped() {
    //        guard let index = index else { return }
    //        delegate?.WatchEpisodesButtonTapped(index: index)
    //    }
    
}
//MARK: - setConstraints

extension MainTableViewCell {
    
    private func setConstraints() {
        
        let characterStackView = UIStackView(arrangedSubviews: [characterTitleLabel, characterDescription],
                                             axis: .vertical,
                                             spacing: 4,
                                             distribution: .fillProportionally)
        
        
        addSubview(characterImageView)
        NSLayoutConstraint.activate(
            [characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
             characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
             characterImageView.heightAnchor.constraint(equalToConstant: 120),
             characterImageView.widthAnchor.constraint(equalToConstant: 120)
            ]
        )
        
        addSubview(characterStatus)
        NSLayoutConstraint.activate(
            [characterStatus.topAnchor.constraint(equalTo: topAnchor,
                                                  constant: 16),
             characterStatus.trailingAnchor.constraint(equalTo: trailingAnchor),
             characterStatus.heightAnchor.constraint(equalToConstant: 25),
             characterStatus.widthAnchor.constraint(equalToConstant: 56)
            ]
        )
        
        addSubview(characterStackView)
        NSLayoutConstraint.activate(
            [characterStackView.topAnchor.constraint(equalTo: topAnchor,
                                                     constant: 16),
             characterStackView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,
                                                         constant: 18),
             characterStackView.trailingAnchor.constraint(equalTo: characterStatus.leadingAnchor,
                                                          constant: -5),
             characterStackView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                        constant: -90)
            ]
        )
        
        contentView.addSubview(watchButton)
        NSLayoutConstraint.activate(
            [watchButton.topAnchor.constraint(equalTo: characterStackView.bottomAnchor,
                                              constant: 12),
             watchButton.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,
                                                  constant: 18),
             watchButton.heightAnchor.constraint(equalToConstant: 35),
             watchButton.widthAnchor.constraint(equalToConstant: 148)
            ]
        )
        
        watchButton.addSubview(watchView)
        NSLayoutConstraint.activate(
            [watchView.centerYAnchor.constraint(equalTo: watchButton.centerYAnchor),
             watchView.centerXAnchor.constraint(equalTo: watchButton.centerXAnchor),
             watchView.heightAnchor.constraint(equalTo: watchButton.heightAnchor),
             watchView.widthAnchor.constraint(equalTo: watchButton.widthAnchor)
            ]
        )
        
        watchView.addSubview(watchImageView)
        watchView.addSubview(watchLabel)
        NSLayoutConstraint.activate(
            [watchImageView.centerYAnchor.constraint(equalTo: watchView.centerYAnchor),
             watchImageView.leadingAnchor.constraint(equalTo: watchView.leadingAnchor,
                                                     constant: 12),
             watchLabel.centerYAnchor.constraint(equalTo: watchView.centerYAnchor),
             watchLabel.leadingAnchor.constraint(equalTo: watchImageView.trailingAnchor,
                                                 constant: 6)
            ]
        )
        
        contentView.addSubview(placeView)
        NSLayoutConstraint.activate(
            [placeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: -16),
             placeView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,
                                                constant: 18),
             placeView.topAnchor.constraint(equalTo: watchButton.bottomAnchor,
                                            constant: 10),
             placeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ]
        )
        
        placeView.addSubview(placeButton)
        placeView.addSubview(placeLabel)
        NSLayoutConstraint.activate(
            [placeButton.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,
                                                  constant: 18),
             placeButton.centerYAnchor.constraint(equalTo: placeView.centerYAnchor),
             placeButton.heightAnchor.constraint(equalToConstant: 12),
             placeButton.widthAnchor.constraint(equalToConstant: 8.4),
             placeLabel.centerYAnchor.constraint(equalTo: placeView.centerYAnchor),
             placeLabel.leadingAnchor.constraint(equalTo: placeButton.trailingAnchor,
                                                 constant: 7.8)
            ]
        )
    }
}
