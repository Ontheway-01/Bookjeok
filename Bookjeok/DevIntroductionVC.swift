//
//  IntroductionVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/08/03.
//

import Foundation
import UIKit

//protocol DevIntroDelegate{
//    func color() -> UIColor?
//    func font() -> UIFont?
//}

class DevIntroductionVC: UIViewController{
//    open var colorHandler: ((UIColor)->Void)? = nil
    
//    open var devIntroDelegate: DevIntroDelegate? = nil
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDevName: UILabel!
    @IBOutlet weak var lblHeight: UILabel!
    @IBOutlet weak var lblDevHeight: UILabel!
    @IBOutlet weak var lblInsta: UILabel!
    @IBOutlet weak var lblDevInsta: UILabel!
    
    var colorTheme: UIColor = .systemPink
    var fontTheme: UIFont = .systemFont(ofSize: 17.0)
    
    @objc func onChangedColorFont(_ sender: Notification) {
        let userDefault = UserDefaults.standard
        let colorName = (userDefault.object(forKey: "AppColor") as? String) ?? "Coral"
        print(colorName)
        colorTheme = colorList[colorName] ?? .systemPink
        let fontName = (userDefault.object(forKey: "AppFont") as? String) ?? "Arial"
        print(fontName)
        fontTheme = UIFont(name: fontName, size: 17.0) ?? .systemFont(ofSize: 17.0)
        setColor(color: colorTheme)
        setFont(font: fontTheme)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onChangedColorFont(_:)), name: .ColorFontChanged, object: nil)
//        colorTheme = devIntroDelegate?.color() ?? .systemPink
//        fontTheme = devIntroDelegate?.font() ?? .systemFont(ofSize: 17.0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
//        colorHandler?(UIColor.red)
    }
    
    func setColor(color: UIColor){
        lblName.textColor = color
        lblHeight.textColor = color
        lblInsta.textColor = color
    }
    
    func setFont(font: UIFont){
        lblName.font = font
        lblDevName.font = font
        lblHeight.font = font
        lblDevHeight.font = font
        lblInsta.font = font
        lblDevInsta.font = font
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

