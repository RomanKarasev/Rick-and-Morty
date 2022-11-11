//
//  Constants.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 11.11.2022.
//

import Foundation
import UIKit

enum Constants {
    
    static let characterStatusButtonInset: UIEdgeInsets = .init(top: 4, left: 8, bottom: 4, right: 8)
    static let watchImageViewFrame       : CGRect       = CGRect(x: 0, y: 0, width: 10, height: 12)
    
    enum Strings {
        static let emptyString                  = ""
        static let mainTableViewCellIdentifier  = "MenuTableViewCell"
        static let watchButtonText              = "Watch episodes"
        static let cIFilterName                 = "CIPhotoEffectNoir"
        
    }
   
    enum Colors {
        static let aliveLabelBackgroundColor    = UIColor(hexString: "#C7FFB9")
        static let deadLabelBackgroundColor     = UIColor(hexString: "#FFE8E0")
        static let unknownLabelBackgroundColor  = UIColor(hexString: "#EEEEEE")
        static let aliveTextColor               = UIColor(hexString: "#319F16")
        static let deadTextColor                = UIColor(hexString: "#E93800")
        static let unknownTextColor             = UIColor(hexString: "#A0A0A0")
        
        static let watchBackgroundColor         = #colorLiteral(red: 0.9993386865, green: 0.9451721311, blue: 0.9001642466, alpha: 1)
        static let watchTextBackgroundColor     = UIColor(hexString: "#FF6B00")
    }
    
    enum Images {
        static let defaultCharacter = UIImage(named: "default")
        static let watchButtonImage = UIImage(named: "play")
        static let placeButtonImage = UIImage(named: "map")
           
    }
    
    enum FontSize {
        static let font14: UIFont = .systemFont(ofSize: 14)
        static let font21: UIFont = .systemFont(ofSize: 21)
    }
    
    enum CGFloafs {
        
        static let heightForRow                     : CGFloat   = 152
        static let characterImageViewCornerRadius   : CGFloat   = 40
        
        static let watchBattonCornerRadius          : CGFloat   = 17
        static let characterStatusCornerRadius      : CGFloat   = 25 / 2
        
        
        enum Constraints {
            
            static let characterImageViewHeightWidth    : CGFloat = 120
            static let characterStatusTopAncor          : CGFloat = 16
            static let characterStatusHeightAncor       : CGFloat = 25
            
            enum tableView {
                static let topAncor: CGFloat        = 90
                static let leadingAncor: CGFloat    = 24
                static let trailingAnchor: CGFloat  = -24
            }
            
            enum CharacterStackView {
                static let characterStackViewSpacing        : CGFloat = 4
                
                static let characterStackViewTopAncor       : CGFloat = 16
                static let characterStackViewleadingAncor   : CGFloat = 18
                static let characterStackViewTrailingAncor  : CGFloat = -120
                static let characterStackViewBottomAncor    : CGFloat = -90
            }
            
            enum WatchView {
                static let watchButtonTopAncor          : CGFloat = 12
                static let watchButtonLeadingAncor      : CGFloat = 18
                static let watchButtonHeightAncor       : CGFloat = 35
                static let watchButtonWidthAncor       : CGFloat = 148
                static let watchImageViewLeadingAnchor  : CGFloat = 12
                static let watchLabelLeadingAnchor      : CGFloat = 6
            }
            
            enum PlaceView {
                static let placeViewBottomAnchor    : CGFloat = -16
                static let placeViewLeadingAnchor   : CGFloat = 18
                static let placeViewTopAnchor       : CGFloat = 10
                static let placeButtonLeadingAncor  : CGFloat = 18
                static let placeButtonHeightAnchor  : CGFloat = 12
                static let placeButtonWidthAnchor   : CGFloat = 8.4
                static let placeLabelLeadingAncor   : CGFloat = 7.8
            }
        }
    }
}




  
