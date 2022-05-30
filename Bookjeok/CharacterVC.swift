//
//  characterVC.swift
//  bookjuk
//
//  Created by 이은화 on 2022/05/25.
//

import Foundation
import UIKit
class CharacterVC:UIViewController{
    
    @IBOutlet weak var lblMyChar: UILabel!
    @IBOutlet weak var imgViewChar: UIImageView!
    @IBOutlet weak var btnCharStory: UIButton!
    @IBOutlet weak var lblMyCharList: UILabel!
    @IBOutlet weak var btnSelectSection: UIButton!
    @IBOutlet weak var btnSelectSectionSmall: UIButton!
    @IBOutlet weak var lblLevel: UILabel!
    @IBOutlet weak var btnLevelDown: UIButton!
    @IBOutlet weak var btnLevelUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblLevel.layer.cornerRadius = 10
        lblLevel.layer.masksToBounds = true
    }
    
    @IBAction func clickBtnCharStory(_ sender: UIButton) {
        
    }
    
    @IBAction func clickBtnSelectSection(_ sender: UIButton) {
    }
    
    @IBAction func clickBtnSelectSectionSmall(_ sender: UIButton){
        
    }
    
    @IBAction func clickBtnLevelDown(_ sender: UIButton){
        
    }
    
    @IBAction func clickBtnLevelUp(_ sender: UIButton){
        
    }
}
