//
//  WannaReadBookCell.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/13.
//

import Foundation
import UIKit
class WannaReadBookCell: LibraryBaseCell {
    
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    @IBOutlet weak var heightPlus: UILabel!
    @IBOutlet weak var lblExpectation: UILabel!
    
    override func setData(_ data: ModelBookInfo) {
        super.setData(data)

        lblBookName.text = data.title
        lblBookAuthor.text = data.writer
        heightPlus.text = String(data.page/200)
        lblExpectation.text = String(data.expectation!)
    }
}
