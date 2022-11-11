//
//  MainTableViewCell.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 10.11.2022.
//

import UIKit
import SDWebImage

// MARK: - MainTableViewCell

final class MainTableViewCell: UITableViewCell {
    
    static let identifier   = Constants.Strings.mainTableViewCellIdentifier
    
    //MARK: ImageViews
    
    let characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = Constants.CGFloafs.characterImageViewCornerRadius
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    
    private let watchImageView: UIImageView = {
        let imageView = UIImageView(frame: Constants.watchImageViewFrame)
        imageView.image = Constants.Images.watchButtonImage
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: Views
    
    private let watchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let placeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    //MARK: Labels
    
    private let characterTitleLabel = UILabel(text: Constants.Strings.emptyString,
                                              font: Constants.FontSize.font21,
                                              alignment: .left,
                                              textColor: .label)
    
    private let characterDescription = UILabel(text: Constants.Strings.emptyString,
                                               font: Constants.FontSize.font14,
                                               alignment: .left,
                                               textColor: .label)
    
    private let watchLabel = UILabel(text: Constants.Strings.watchButtonText,
                                     font: Constants.FontSize.font14,
                                     alignment: .left,
                                     textColor: Constants.Colors.watchTextBackgroundColor)
    
    
    private let placeLabel = UILabel(text: Constants.Strings.emptyString,
                                     font: Constants.FontSize.font14,
                                     alignment: .left,
                                     textColor: .label)
    
    //MARK: Buttons
#warning("TODO: сделать action для кнопок")
    private let watchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Constants.CGFloafs.watchBattonCornerRadius
        button.backgroundColor = Constants.Colors.watchBackgroundColor
        return button
    }()
    
    private let placeButton: UIButton = {
        let button = UIButton()
        button.setImage(Constants.Images.placeButtonImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let characterStatus: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.Strings.emptyString, for: .normal)
        button.contentMode = .center
        button.titleLabel?.font = Constants.FontSize.font14
        button.contentEdgeInsets = Constants.characterStatusButtonInset
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = Constants.CGFloafs.characterStatusCornerRadius
        return button
    }()
    
    // MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstraints()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    
    //MARK: renderData from ViewModel
    
    func render(from model: ViewModel) {
        let mainImage = configureImage(with: model.image)
        
        
        //Настройка отображения в зависимости от статуса
        switch model.status {
            case .alive:
                setStatusChanged(from: model,
                                 labelbackgroundColor: Constants.Colors.aliveLabelBackgroundColor,
                                 textColor: Constants.Colors.aliveTextColor,
                                 characterImage: mainImage)
            case .dead:
                setStatusChanged(from: model,
                                 labelbackgroundColor: Constants.Colors.deadLabelBackgroundColor,
                                 textColor: Constants.Colors.deadTextColor,
                                 characterImage: grayscale(image: mainImage))
            case .unknown:
                setStatusChanged(from: model,
                                 labelbackgroundColor: Constants.Colors.unknownLabelBackgroundColor,
                                 textColor: Constants.Colors.unknownTextColor,
                                 characterImage: mainImage)
        }
    }
    
    //MARK: set data
    private func setStatusChanged(from model: ViewModel, labelbackgroundColor: UIColor, textColor: UIColor, characterImage: UIImage) {
        let statusText = model.status.rawValue
        
        characterTitleLabel.text = model.name
        characterDescription.text = "\(model.species), \(model.gender)"
        placeLabel.text = model.origin
        
        characterStatus.backgroundColor = labelbackgroundColor
        
        characterStatus.setTitle(statusText.uppercased(), for: .normal)
        characterStatus.setTitleColor(textColor, for: .normal)
        
        characterImageView.image = characterImage
    }
    
    //MARK: b&w filter
    
    private func grayscale(image: UIImage) -> UIImage {
        let context = CIContext(options: nil)
        if let filter = CIFilter(name: Constants.Strings.cIFilterName) {
            filter.setValue(CIImage(image: image), forKey: kCIInputImageKey)
            if let output = filter.outputImage {
                if let cgImage = context.createCGImage(output, from: output.extent) {
                    return UIImage(cgImage: cgImage)
                }
            }
        }
        return image
    }
    
    //MARK: SDwebImage
    private func configureImage(with model: String) -> UIImage {
        let url = URL(string: model)
        characterImageView.sd_setImage(with: url, completed: nil)
        
        return characterImageView.image ?? Constants.Images.defaultCharacter!
    }
}

//MARK: - setConstraints

extension MainTableViewCell {
    
    private func setConstraints() {
        
        let characterStackView = UIStackView(arrangedSubviews: [characterTitleLabel, characterDescription],
                                             axis: .vertical,
                                             spacing: Constants.CGFloafs.Constraints.CharacterStackView.characterStackViewSpacing,
                                             distribution: .fillProportionally)
        
        
        addSubview(characterImageView)
        NSLayoutConstraint.activate(
            [characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
             characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
             characterImageView.heightAnchor.constraint(equalToConstant: Constants.CGFloafs.Constraints.characterImageViewHeightWidth),
             characterImageView.widthAnchor.constraint(equalToConstant: Constants.CGFloafs.Constraints.characterImageViewHeightWidth)
            ]
        )
        
        addSubview(characterStackView)
        NSLayoutConstraint.activate(
            [characterStackView.topAnchor.constraint(equalTo: topAnchor,
                                                     constant: Constants.CGFloafs.Constraints.CharacterStackView.characterStackViewTopAncor ),
             characterStackView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,
                                                         constant: Constants.CGFloafs.Constraints.CharacterStackView.characterStackViewleadingAncor ),
             characterStackView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                          constant: Constants.CGFloafs.Constraints.CharacterStackView.characterStackViewTrailingAncor),
             characterStackView.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                        constant: Constants.CGFloafs.Constraints.CharacterStackView.characterStackViewBottomAncor )
            ]
        )
        
        addSubview(characterStatus)
        NSLayoutConstraint.activate(
            [characterStatus.topAnchor.constraint(equalTo: topAnchor,
                                                  constant: Constants.CGFloafs.Constraints.characterStatusTopAncor),
             characterStatus.trailingAnchor.constraint(equalTo: trailingAnchor),
             characterStatus.heightAnchor.constraint(equalToConstant: Constants.CGFloafs.Constraints.characterStatusHeightAncor)
            ]
        )
        
        //MARK: WatchView
        
        
        contentView.addSubview(watchButton)
        NSLayoutConstraint.activate(
            [watchButton.topAnchor.constraint(equalTo: characterStackView.bottomAnchor,
                                              constant: Constants.CGFloafs.Constraints.WatchView.watchButtonTopAncor),
             watchButton.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,
                                                  constant: Constants.CGFloafs.Constraints.WatchView.watchButtonLeadingAncor),
             watchButton.heightAnchor.constraint(equalToConstant: Constants.CGFloafs.Constraints.WatchView.watchButtonHeightAncor),
             watchButton.widthAnchor.constraint(equalToConstant: Constants.CGFloafs.Constraints.WatchView.watchButtonWidthAncor )
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
                                                     constant: Constants.CGFloafs.Constraints.WatchView.watchImageViewLeadingAnchor),
             watchLabel.centerYAnchor.constraint(equalTo: watchView.centerYAnchor),
             watchLabel.leadingAnchor.constraint(equalTo: watchImageView.trailingAnchor,
                                                 constant: Constants.CGFloafs.Constraints.WatchView.watchLabelLeadingAnchor)
            ]
        )
        
        
        //MARK: PlaceView
        contentView.addSubview(placeView)
        NSLayoutConstraint.activate(
            [placeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                               constant: Constants.CGFloafs.Constraints.PlaceView.placeViewBottomAnchor),
             placeView.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,
                                                constant: Constants.CGFloafs.Constraints.PlaceView.placeViewLeadingAnchor),
             placeView.topAnchor.constraint(equalTo: watchButton.bottomAnchor,
                                            constant: Constants.CGFloafs.Constraints.PlaceView.placeViewTopAnchor),
             placeView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ]
        )
        
        placeView.addSubview(placeButton)
        placeView.addSubview(placeLabel)
        NSLayoutConstraint.activate(
            [placeButton.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor,
                                                  constant: Constants.CGFloafs.Constraints.PlaceView.placeButtonLeadingAncor),
             placeButton.centerYAnchor.constraint(equalTo: placeView.centerYAnchor),
             placeButton.heightAnchor.constraint(equalToConstant: Constants.CGFloafs.Constraints.PlaceView.placeButtonHeightAnchor),
             placeButton.widthAnchor.constraint(equalToConstant: Constants.CGFloafs.Constraints.PlaceView.placeButtonWidthAnchor),
             placeLabel.centerYAnchor.constraint(equalTo: placeView.centerYAnchor),
             placeLabel.leadingAnchor.constraint(equalTo: placeButton.trailingAnchor,
                                                 constant: Constants.CGFloafs.Constraints.PlaceView.placeLabelLeadingAncor)
            ]
        )
    }
}
