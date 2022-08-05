//
//  NicknamePopUpVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/27.
//

import Foundation
import UIKit

protocol NicknameDelegate{
    func changeName(name: String?)
    func getNickname() -> String?
}
class NicknamePopUpVC:UIViewController{
    @IBOutlet weak var txtField: UITextField!
    var txt: String?
    open var nicknameDelegate: NicknameDelegate? = nil
    
    override func viewDidLoad() {
        txtField.text = nicknameDelegate?.getNickname() ?? ""
        super.viewDidLoad()
    }
    @IBAction func btnBackGround(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnChange(_ sender: UIButton) {
        txt = txtField.text
        nicknameDelegate?.changeName(name: txt)
        dismiss(animated: true)
    }
    
    
}
