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
    
    @IBOutlet weak var charCollectionView: UICollectionView!
    var data: [String] = []
    let data1 = ["1ch1","1ch2","1ch3","1ch4","1ch5","1ch6","1ch7","1ch8"]
    let data2 = ["2ch1","2ch2","2ch3","2ch4","2ch5","2ch6","2ch7","2ch8"]
    var num: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = data1
        
        lblLevel.layer.cornerRadius = 10
        lblLevel.layer.masksToBounds = true
        charCollectionView.delegate = self
        charCollectionView.dataSource = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        charCollectionView.reloadData()
    }
    
    @IBAction func clickBtnCharStory(_ sender: UIButton) {
        
    }
    
    @IBAction func clickBtnSelectSection(_ sender: UIButton) {
        
    }
    
    @IBAction func clickBtnSelectSectionSmall(_ sender: UIButton){
        
    }
    
    @IBAction func clickBtnLevelDown(_ sender: UIButton){
        num = num - 1
        if(num<0){
            num = num + 1
        }else{
            data = data1
        }
        charCollectionView.reloadData()
    }
    
    @IBAction func clickBtnLevelUp(_ sender: UIButton){
        num = num + 1
        if(num<0){
            num = num - 1
        }else{
            data = data2
        }
        charCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CharacterVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = charCollectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as? CharacterCell
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as? CharacterCell
        let data = data[indexPath.row]
        cell?.lblCharName.text = data
        let charImage = UIImage(named: data)
        cell?.imgChar.image = charImage
    }
}

extension CharacterVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4 - 1
        let height = collectionView.frame.height / 2 - 1
        
        let size = CGSize(width: width, height: height)
        return size
    }
}
