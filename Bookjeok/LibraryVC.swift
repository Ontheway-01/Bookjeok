//
//  LibraryVC.swift
//  bookjuk
//
//  Created by 이은화 on 2022/05/25.
//

import Foundation
import UIKit
import Alamofire
class LibraryVC: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnReadBook: UIButton!
    @IBOutlet weak var btnReadingBook: UIButton!
    @IBOutlet weak var btnWannaReadBook: UIButton!
    
    var bookDatas = [ModelBookInfo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 131
        
        activityIndicator.stopAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        APIManager.instance.getBookAll({ bookInfos in
            self.bookDatas = bookInfos
            self.reloadData()
        }, progress: activityIndicator)
    }
    
    @IBAction func clickBtnAll(_ sender: UIButton) {
        APIManager.instance.getBookAll({ bookInfos in
            self.bookDatas = bookInfos
            self.reloadData()
        }, progress: activityIndicator)
    }
    @IBAction func clickBtnReadBook(_ sender: UIButton) {
        getReadBook()
    }
    @IBAction func clickBtnReadingBook(_ sender: UIButton) {
        getReadingBook()
    }
    @IBAction func clickBtnWannaReadBook(_ sender: UIButton){
        getWannaReadBook()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
//    func getBookAll() {
//        activityIndicator.startAnimating()
//        AF.request(URL_SEARCH_BOOKALL, method: .get, parameters: nil, headers: nil).responseDecodable(of: ModelSearchBook.self){ response in
//            self.activityIndicator.stopAnimating()
//
//            switch response.result {
//            case .success(let response):
//                self.bookDatas = response.data
//                self.reloadData()
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    func getReadBook() {
        activityIndicator.startAnimating()
        AF.request(URL_SEARCH_BOOKREAD, method: .get, parameters: nil, headers: nil).responseDecodable(of: ModelSearchBook.self){ response in
            self.activityIndicator.stopAnimating()
            
            switch response.result {
            case .success(let response):
                self.bookDatas = response.data
                self.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getReadingBook() {
        activityIndicator.startAnimating()
        AF.request(URL_SEARCH_BOOKREADING, method: .get, parameters: nil, headers: nil).responseDecodable(of: ModelSearchBook.self){ response in
            self.activityIndicator.stopAnimating()
            
            switch response.result {
            case .success(let response):
                self.bookDatas = response.data
                self.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getWannaReadBook() {
        activityIndicator.startAnimating()
        AF.request(URL_SEARCH_WANNAREAD, method: .get, parameters: nil, headers: nil).responseDecodable(of: ModelSearchBook.self){ response in
            self.activityIndicator.stopAnimating()
            
            switch response.result {
            case .success(let response):
                self.bookDatas = response.data
                self.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension LibraryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookDatas.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 131
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if bookDatas[indexPath.row].end != nil{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReadBookCell", for: indexPath) as? ReadBookCell
            return cell!
        } else if bookDatas[indexPath.row].readPage != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReadingBookCell", for: indexPath) as? ReadingBookCell
            return cell!
        } else if bookDatas[indexPath.row].expectation != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WannaReadBookCell", for: indexPath) as? WannaReadBookCell
            return cell!
        }
        return UITableViewCell()
    }
        
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let data = bookDatas[indexPath.row]
        (cell as? LibraryBaseCell)?.setData(data)
        
//        if data.end != nil{
//            let cell = cell as? ReadBookCell
//        }else if data.readPage != nil {
////            (cell as? ReadingBookCell)?.setData(data)
//            if let cell = cell as? ReadingBookCell {
//                cell.setData(data)
//            }
//        }else if data.expectation != nil {
//            let cell = cell as? WannaReadBookCell
//
//        }
    }
}


