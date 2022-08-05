//
//  ReadingBookCell.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/06/22.
//

import Foundation
import UIKit
class ReadingBookCell: LibraryBaseCell {
    
    @IBOutlet weak var lblBookName: UILabel!
    @IBOutlet weak var lblBookAuthor: UILabel!
    @IBOutlet weak var lblStartReading: UILabel!
    @IBOutlet weak var readPerBar: UIProgressView!
    @IBOutlet weak var lblPecent: UILabel!
    @IBOutlet weak var lblPage: UILabel!
    
    override func setData(_ data: ModelBookInfo) {
        super.setData(data)
        
        lblBookName.text = data.title
        lblBookAuthor.text = data.writer
        lblPage.text = String(data.page)
        lblStartReading.text = data.start
        
        let readRate = Float(data.readPage ?? 0) / Float(data.page)
        lblPecent.text = String(format: "%.1f", readRate * 100) + "%"
        
        readPerBar.setProgress(readRate, animated: true)
    }
}
