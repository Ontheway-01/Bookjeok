//
//  ListCollectionVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/06/01.
//

import Foundation
import UIKit
import Alamofire

class ListCollectinVC: UIViewController{
    @IBOutlet weak var listCollectioView: UICollectionView!
    var bookData = [ModelBookInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCollectioView.delegate = self
        listCollectioView.dataSource = self
        
        getReadBook()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    func reloadData() {
        listCollectioView.reloadData()
    }
    
    func getReadBook() {
        AF.request(URL_SEARCH_BOOKREAD, method: .get, parameters: nil, headers: nil).responseDecodable(of: ModelSearchBook.self){ response in
            switch response.result {
            case .success(let response):
                self.bookData = response.data
                self.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ListCollectinVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = listCollectioView.dequeueReusableCell(withReuseIdentifier: "ListCollectionCell", for: indexPath) as? ListCollectionCell
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as? ListCollectionCell
        let data = bookData[indexPath.row]
        if let imgUrl = URL(string: data.thumb),
           let imgData = try? Data(contentsOf: imgUrl) {
            cell?.imgViewBook.image = UIImage(data: imgData)
        }
        cell?.lblName.text = data.title
        cell?.lblAuthor.text = data.writer
    }
}

extension ListCollectinVC: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3.2
        let height = collectionView.frame.height / 3
        let size = CGSize(width: width, height: height)
        return size
    }
    
}

