//
//  ViewAllCell.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/06/08.
//

import Foundation
import UIKit

class ReadBookCell: LibraryBaseCell {
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    @IBOutlet var ratingImgs: [UIImageView]!
    @IBOutlet weak var lblStart: UILabel!
    @IBOutlet weak var lblEnd: UILabel!
    
    
    override func setData(_ data: ModelBookInfo) {
        super.setData(data)
        
        lblBookName.text = data.title
        lblBookAuthor.text = data.writer
        lblStart.text = data.start
        lblEnd.text = data.end
    }
    
    
}
