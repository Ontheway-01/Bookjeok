//
//  BookInfoVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/08/31.
//

import Foundation
import UIKit
class BookInfoVC: UIViewController{
    
    @IBOutlet weak var lblBookIntro: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblISBN: UILabel!
    @IBOutlet weak var lblPage: UILabel!
    var data: ModelBookDetail? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "BookInfoSegue"{
            guard let VC: 
        }
    }
}

extension BookInfoVC: BookInfoDelegate{
    func sendBookInfo(model: ModelBookDetail) {
        lblBookIntro.text = model.intro
        lblCompany.text = model.company
        lblISBN.text = model.ISBN
        lblPage.text = String(model.page)
    }
}
