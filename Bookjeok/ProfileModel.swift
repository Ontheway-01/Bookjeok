//
//  ProfileModel.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/06/22.
//

import Foundation
import UIKit
struct ProfileModel{
    var img: UIImage
    var profileMenuTitle: String
    
    init(img: UIImage, profileMenuTitle: String){
        self.img = img
        self.profileMenuTitle = profileMenuTitle
    }
}
