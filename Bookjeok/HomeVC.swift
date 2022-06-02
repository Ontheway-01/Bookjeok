//
//  ViewController.swift
//  bookjuk
//
//  Created by 이은화 on 2022/05/25.
//

import UIKit

class HomeVC: UIViewController {
    @IBOutlet weak var btnCapture: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnSee: UIButton!
    @IBOutlet weak var scSwitch: UISegmentedControl!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var stackView: UIView!
    
    var bookNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickBtnCapture(_ sender: Any) {
        
    }
    
    @IBAction func clickBtnSee(_ sender: Any) {
        
    }
    
    @IBAction func switchView(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0){
            stackView.alpha = 1.0
            listView.alpha = 0.0
        }else{
            stackView.alpha = 0.0
            listView.alpha = 1.0
        }
    }
}

extension HomeVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

