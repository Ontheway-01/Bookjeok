//
//  RecordVC.swift
//  bookjuk
//
//  Created by 이은화 on 2022/05/25.
//

import Foundation
import UIKit
class RecordVC:UIViewController{
    
    @IBOutlet weak var scRecord: UISegmentedControl!
    @IBOutlet weak var myMemoView: UIView!
    @IBOutlet weak var chartView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func switchMemoChart(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0){
            myMemoView.alpha = 1.0
            chartView.alpha = 0.0
        }else{
            myMemoView.alpha = 0.0
            chartView.alpha = 1.0
        }
    }
}
