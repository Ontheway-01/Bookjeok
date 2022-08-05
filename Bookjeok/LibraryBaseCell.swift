//
//  LibraryBaseCell.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/13.
//

import Foundation
import UIKit
import Alamofire


class LibraryBaseCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    func setData(_ data: ModelBookInfo) {
        imgView.image = nil
        downloadImageFile(data.thumb)
//        if let imgUrl = URL(string: data.thumb),
//           let imgData = try? Data(contentsOf: imgUrl) {
//            imgView.image = UIImage(data: imgData)
//        }
        
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 12
//            backView.layer.borderColor = UIColor.black.cgColor
//            backView.layer.borderWidth = 1.0
        backView.layer.shadowColor = UIColor.black.cgColor
        backView.layer.shadowOpacity = 1
        backView.layer.shadowOffset = .zero
        backView.layer.shadowRadius = 4
        
    }
    
    func downloadImageFile(_ strImgPath: String) {
        guard let imgUrl = URL(string: strImgPath) else {
            return
        }
        
        AF.download(imgUrl).response { response in
            if let imageUrl = response.fileURL?.path {
                self.imgView.image = UIImage(contentsOfFile: imageUrl)
            }
            
        }
    }
    
}
