//
//  ProfileImgPopUpVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/27.
//

import Foundation
import UIKit
class ProfileImgPopUpVC: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBackGround(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnImgDelete(_ sender: UIButton) {
    }
    
    @IBAction func btnImgSelect(_ sender: Any) {
    }
    
    @IBAction func btnCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
