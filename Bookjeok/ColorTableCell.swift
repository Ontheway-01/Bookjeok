//
//  ColorTableCell.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/27.
//

import Foundation
import UIKit
class ColorTableCell:UITableViewCell{
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var outerCheck: UIView!
    @IBOutlet weak var innerCheck: UIView!
    
    
    func setView(colorName: String, colorCode: UIColor, isSelected: Bool){
        colorView.layer.cornerRadius = colorView.frame.height/2
        outerCheck.layer.cornerRadius = outerCheck.frame.height/2
        outerCheck.layer.borderWidth = 3
        innerCheck.layer.cornerRadius = innerCheck.frame.height/2
        lblColor.text = colorName
        colorView.layer.backgroundColor = colorCode.cgColor
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
