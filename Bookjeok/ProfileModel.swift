//
//  ProfileModel.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/06/22.
//

import Foundation
import UIKit

struct ProfileModel{
    var type: ProfileMenuType
    var img: UIImage
    var profileMenuTitle: String
    
    init(menuType: ProfileMenuType) {
        self.type = menuType
        self.img = menuType.iconImage
        self.profileMenuTitle = menuType.titleText
    }
    
    init(img: UIImage, profileMenuTitle: String){
        type = .ExportData
        
        self.img = img
        self.profileMenuTitle = profileMenuTitle
    }
}
