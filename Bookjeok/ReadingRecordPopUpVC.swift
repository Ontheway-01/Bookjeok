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
    var select = [false, false]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        btnStartDate.layer.borderColor = UIColor.lightGray.cgColor
        btnEndDate.layer.borderColor = UIColor.lightGray.cgColor
        btnSend.layer.cornerRadius = btnSend.frame.height/3
        tableView.reloadData()
    }
    @IBAction func clickBtnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickStartDate(_ sender: Any) {
        
    }
    @IBAction func clickEndDate(_ sender: Any) {
        
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
        (cell as? ReadingRecordCell)?.setView(cellTitle: cellTitle[indexPath.row], isSelected: select[indexPath.row])
        
    }
}
