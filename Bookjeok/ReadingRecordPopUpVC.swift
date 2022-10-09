//
//  ReadingRecordPopUpVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/08/03.
//

import Foundation
import UIKit
class ReadingRecordPopUpVC: UIViewController{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnStartDate: UIButton!
    @IBOutlet weak var btnEndDate: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    
    let cellTitle = ["전체", "기간 선택"]
    var select = [true, false]
    var colorTheme: UIColor = .systemPink
    
//    @objc func onChangedColorFont(_ sender: Notification) {
//        let userDefault = UserDefaults.standard
//        let colorName = (userDefault.object(forKey: "AppColor") as? String) ?? "Coral"
//        colorTheme = colorList[colorName] ?? .systemPink
//        
//        tableView.reloadData()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(onChangedColorFont(_:)), name: .ColorFontChanged, object: nil)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        btnStartDate.layer.borderColor = UIColor.lightGray.cgColor
//        btnStartDate.titleLabel?.text = dateFormat(date: Date())
        btnEndDate.layer.borderColor = UIColor.lightGray.cgColor
//        btnEndDate.titleLabel?.text = dateFormat(date: Date())
        btnSend.layer.cornerRadius = btnSend.frame.height/3
        btnSend.tintColor = colorTheme
        
        tableView.reloadData()
        
    }
    @IBAction func clickBtnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickStartDate(_ sender: Any) {
        if select[1] == true{
            
        }
    }
    @IBAction func clickEndDate(_ sender: Any) {
        if select[1] == true{
            
        }
    }
    
//    func dateFormat(date: Date) -> String{
//        var formatter = DateFormatter()
//        formatter.dateFormat = "YYYY.MM.dd"
//        var strDate = formatter.string(from: date)
//        return strDate
//    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ReadingRecordPopUpVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        select[0] = false
        select[1] = false
        select[indexPath.row] = true
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReadingRecordCell", for: indexPath) as? ReadingRecordCell
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? ReadingRecordCell)?.setView(cellTitle: cellTitle[indexPath.row], isSelected: select[indexPath.row], color: colorTheme)
        
    }
}
