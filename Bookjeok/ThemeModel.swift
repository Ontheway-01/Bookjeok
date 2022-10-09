//
//  ThemeModel.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/09/28.
//

import Foundation
import UIKit

struct ThemeModel{
    var themeColor: UIColor
    var themeFont: UIFont
    
    init(color: UIColor, font: UIFont){
        self.themeColor = color
        self.themeFont = font
    }
}


