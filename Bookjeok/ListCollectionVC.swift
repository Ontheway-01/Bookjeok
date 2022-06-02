//
//  ListCollectionVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/06/01.
//

import Foundation
import UIKit
class ListCollectinVC: UIViewController{
    @IBOutlet weak var listCollectioView: UICollectionView!
    var list = ["1","2", "3","4","5","6","7","8","9","10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCollectioView.delegate = self
        listCollectioView.dataSource = self
        listCollectioView.reloadData()
    }
    
}

extension ListCollectinVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listCollectioView.dequeueReusableCell(withReuseIdentifier: "ListCollectionCell", for: indexPath) as? ListCollectionCell
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as? ListCollectionCell
        let data = list[indexPath.row]
        cell?.lblName.text = data
    }
}

extension ListCollectinVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)
        return size
    }
    
}

