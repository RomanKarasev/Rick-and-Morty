//
//  UILabel + Ext.swift
//  Rick and Morty
//
//  Created by Роман Карасёв on 10.11.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String, font: UIFont?, alignment: NSTextAlignment, textColor: UIColor) {
        self.init()
        self.text                                       = text
        self.font                                       = font
        self.textColor                                  = textColor
        self.textAlignment                              = alignment
        self.adjustsFontSizeToFitWidth                  = true
        self.translatesAutoresizingMaskIntoConstraints  = false
    }
}


