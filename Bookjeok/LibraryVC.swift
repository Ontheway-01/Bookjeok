//
//  LibraryVC.swift
//  bookjuk
//
//  Created by 이은화 on 2022/05/25.
//

import Foundation
import UIKit
class LibraryVC:UIViewController{
    
    @IBOutlet weak var scBookClassify: UISegmentedControl!
    @IBOutlet weak var viewAll: UIView!
    @IBOutlet weak var viewReadBooks: UIView!
    @IBOutlet weak var viewReadingBooks: UIView!
    @IBOutlet weak var viewWannaReadBooks: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchBookView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            viewAll.alpha = 1.0
            viewReadBooks.alpha = 0.0
            viewReadingBooks.alpha = 0.0
            viewWannaReadBooks.alpha = 0.0
        case 1:
            viewAll.alpha = 0.0
            viewReadBooks.alpha = 1.0
            viewReadingBooks.alpha = 0.0
            viewWannaReadBooks.alpha = 0.0
        case 2:
            viewAll.alpha = 0.0
            viewReadBooks.alpha = 0.0
            viewReadingBooks.alpha = 1.0
            viewWannaReadBooks.alpha = 0.0
        case 3:
            viewAll.alpha = 0.0
            viewReadBooks.alpha = 0.0
            viewReadingBooks.alpha = 0.0
            viewWannaReadBooks.alpha = 1.0
        default: break
        }
        
    }
    
}

