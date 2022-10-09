//
//  ReadingRecordCell.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/08/03.
//

import Foundation
import UIKit
class StackListCell: UITableViewCell{
    
    @IBOutlet weak var viwBook: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var cstCenter: NSLayoutConstraint!

    
    func setData(bookInfo: ModelBookInfo){
        viwBook.backgroundColor = UIColor.random()
        lblTitle.text = bookInfo.title
        
        cstCenter.constant = CGFloat(Int.random(in: -50..<50))
    }
}


extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
