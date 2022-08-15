//
//  LogoutPopUpVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/27.
//

import Foundation
import UIKit
class LogoutPopUpVC:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnBackGround(_ sender: Any) {
        dismiss(animated: false)
    }
    @IBAction func btnCancel(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
}
