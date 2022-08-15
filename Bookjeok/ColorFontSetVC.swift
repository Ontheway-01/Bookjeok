//
//  ColorFontSetVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/27.
//

import Foundation
import UIKit

class ColorOption{
    var colorName: String
    var colorCode: UIColor
    var isSelected: Bool = false
    init(colorName: String, colorCode: UIColor){
        self.colorName = colorName
        self.colorCode = colorCode
    }
}

class FontOption{
    var fontName: String
    var fontCode: UIFont
    var isSelected: Bool = false
    init(fontName: String, fontCode: UIFont){
        self.fontName = fontName
        self.fontCode = fontCode
    }
}

class ColorFontSetVC:UIViewController{
    enum ColorFontState {
        case Color
        case Font
    }
    
    @IBOutlet weak var colorView1: UIView!
    @IBOutlet weak var colorView2: UIView!
    @IBOutlet weak var colorView3: UIView!
    @IBOutlet weak var colorView4: UIView!
    @IBOutlet weak var lblFontChange: UILabel!
    @IBOutlet weak var btnSet: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    let colorList : [String : UIColor] = ["Coral": UIColor.systemPink,"Yellow":UIColor.yellow ,"Green":UIColor.green,"Blue":UIColor.blue,"Purple":UIColor.purple,"Gray":UIColor.gray]
    let fontList = ["Arial", "ArialHebrew", "Avenir-Black", "AvenirNext-Bold"]
    var colorData = [ColorOption]()
    var fontData = [FontOption]()
    var colorTheme : String = "Coral"
    var state: ColorFontState = .Color
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        btnSet.layer.backgroundColor = colorList[colorTheme]!.cgColor
        btnSet.tintColor = UIColor.white
        setViewColor(colorCode: colorList[colorTheme]!)
        initOptionDatas()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnColor(_ sender: Any) {
        state = .Color
        tableView.reloadData()
    }
    
    @IBAction func btnFont(_ sender: Any) {
        state = .Font
        tableView.reloadData()
    }
    
    func initOptionDatas(){
        for key in colorList.keys.sorted() {
            colorData.append(ColorOption(colorName: key, colorCode: colorList[key] ?? .black))
            
        }
        for element in fontList{
            fontData.append(FontOption(fontName: element, fontCode: UIFont(name: element, size: UIFont.labelFontSize)!))
        }
    }
    func setViewColor(colorCode: UIColor){
        colorView1.layer.cornerRadius = colorView1.frame.height/3
        colorView2.layer.cornerRadius = colorView2.frame.height/3
        colorView3.layer.cornerRadius = colorView3.frame.height/3
        colorView4.layer.cornerRadius = colorView4.frame.height/3
        colorView1.layer.backgroundColor = colorCode.cgColor
        colorView2.layer.backgroundColor = colorCode.cgColor.copy(alpha: 0.5)
        colorView3.layer.backgroundColor = colorCode.cgColor.copy(alpha: 0.75)
        colorView4.layer.backgroundColor = colorCode.cgColor.copy(alpha: 0.25)
        
    }
    func setFontLabel(fontCode: UIFont){
        lblFontChange.font = fontCode
    }
    
    
}

extension ColorFontSetVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if state == .Color {
            let data = colorData[indexPath.row]
            setViewColor(colorCode: data.colorCode)
            colorTheme = data.colorName
            for colorOption in colorData {
                colorOption.isSelected = false
            }
            data.isSelected = true
            btnSet.layer.backgroundColor = colorList[colorTheme]!.cgColor
            tableView.reloadData()
        } else if state == .Font {
            let data = fontData[indexPath.row]
            setFontLabel(fontCode: data.fontCode)
            for fontOption in fontData {
                fontOption.isSelected = false
            }
            data.isSelected = true
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if state == .Color {
            return colorList.count
        }else if state == .Font {
            return fontData.count
        }
        return 0
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if state == .Color {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ColorTableCell", for: indexPath) as? ColorTableCell
            return cell!
        }else if state == .Font {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FontTableCell", for: indexPath) as? FontTableCell
            return cell!
        }
    return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if state == .Color {
            let color = colorData[indexPath.row]
            (cell as? ColorTableCell)?.setView(colorName: color.colorName, colorCode: color.colorCode,isSelected: color.isSelected)
        }else if state == .Font {
            let font = fontData[indexPath.row]
            (cell as? FontTableCell)?.setCell(fontOption: font,colorCode: colorList[colorTheme]!)
           
        }
    }
}
