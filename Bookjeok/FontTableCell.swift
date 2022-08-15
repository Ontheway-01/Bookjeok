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
    
    
    func setCell(fontOption: FontOption, colorCode: UIColor){
        lblFontName.text = fontOption.fontName
        lblFontName.font = fontOption.fontCode
        outerCheck.layer.cornerRadius = outerCheck.frame.height/2
        outerCheck.layer.borderWidth = 3
        innerCheck.layer.cornerRadius = innerCheck.frame.height/2
        
        if fontOption.isSelected {
            outerCheck.layer.borderColor = colorCode.cgColor
            innerCheck.layer.backgroundColor = colorCode.cgColor
        } else{
            outerCheck.layer.borderColor = UIColor.gray.cgColor
            outerCheck.layer.backgroundColor = UIColor.white.cgColor
            innerCheck.layer.backgroundColor = UIColor.white.cgColor
            
        }
    }
}
