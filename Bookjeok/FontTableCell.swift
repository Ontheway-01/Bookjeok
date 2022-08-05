//
//  FontTableCell.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/08/03.
//

import Foundation
import UIKit
class FontTableCell: UITableViewCell{
    @IBOutlet weak var lblFontName: UILabel!
    @IBOutlet weak var outerCheck: UIView!
    @IBOutlet weak var innerCheck: UIView!
    
    func setView(colorCode:UIColor, isSelected:Bool){
        outerCheck.layer.cornerRadius = outerCheck.frame.height/2
        outerCheck.layer.borderWidth = 3
        innerCheck.layer.cornerRadius = innerCheck.frame.height/2
        if isSelected {
            outerCheck.layer.borderColor = colorCode.cgColor
            innerCheck.layer.backgroundColor = colorCode.cgColor
        } else{
            outerCheck.layer.borderColor = UIColor.gray.cgColor
            outerCheck.layer.backgroundColor = UIColor.white.cgColor
            innerCheck.layer.backgroundColor = UIColor.white.cgColor
            
        }
    }
}
