//
//  ReadingRecordCell.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/08/03.
//

import Foundation
import UIKit
class ReadingRecordCell: UITableViewCell{
    @IBOutlet weak var lblOption: UILabel!
    @IBOutlet weak var outerCheck: UIView!
    @IBOutlet weak var innerCheck: UIView!
    
    func setView(cellTitle: String, isSelected: Bool){
        lblOption.text = cellTitle
        outerCheck.layer.cornerRadius = outerCheck.frame.height/2
        
        outerCheck.layer.borderWidth = 1.0
        innerCheck.layer.cornerRadius = innerCheck.frame.height/2
        
        if isSelected{
            outerCheck.layer.borderColor = UIColor.systemPink.cgColor
            innerCheck.layer.backgroundColor = UIColor.systemPink.cgColor
        }else{
            outerCheck.layer.backgroundColor = UIColor.white.cgColor
            outerCheck.layer.borderColor = UIColor.lightGray.cgColor
            innerCheck.layer.backgroundColor = UIColor.white.cgColor
        }
    }
}
