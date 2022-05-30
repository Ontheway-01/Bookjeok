//
//  ProfileVC.swift
//  bookjuk
//
//  Created by 이은화 on 2022/05/25.
//

import Foundation
import UIKit
class ProfileVC:UIViewController{
    
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var lblNickname: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImgView.layer.cornerRadius = profileImgView.frame.height/2
        profileImgView.layer.borderWidth = 1.0
        profileImgView.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        profileImgView.clipsToBounds = true
    }
}
