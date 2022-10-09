//
//  LogoutPopUpVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/27.
//

import Foundation
import UIKit

protocol LogoutDelegate{
    func color() -> UIColor?
}

class LogoutPopUpVC:UIViewController{
    @IBOutlet weak var lblOK: UIButton!
    
    var logoutDelegate: LogoutDelegate? = nil
    var colorTheme: UIColor = .systemPink
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorTheme = logoutDelegate?.color() ?? .systemPink
    }
    
    @IBAction func btnBackGround(_ sender: Any) {
        dismiss(animated: false)
    }
    @IBAction func btnCancel(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    func setColor(color: UIColor){
        lblOK.tintColor = colorTheme
    }
    
}
