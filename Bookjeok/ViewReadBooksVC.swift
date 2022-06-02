//
//  ViewReadBooksVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/06/02.
//

import Foundation
import UIKit
class ViewReadBooksVC: UIViewController{
    @IBOutlet weak var viewReadBooksTableView: UITableView!
    
}

extension ViewReadBooksVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}
