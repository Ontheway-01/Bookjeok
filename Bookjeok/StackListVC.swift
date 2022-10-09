//
//  StackListVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/08/31.
//

import Foundation
import UIKit
import Alamofire

class StackListVC: UIViewController{
 
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cstTableViewTop: NSLayoutConstraint!
    
    var bookDatas: [ModelBookInfo]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getBookData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func getBookData() {
        AF.request(URL_SEARCH_BOOKREAD, method: .get, parameters: nil, headers: nil).responseDecodable(of: ModelSearchBook.self){ response in

            switch response.result {
            case .success(let response):
                self.bookDatas = response.data
                
                self.adjustTableViewTop()
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func adjustTableViewTop() {

        guard let bookDatas = self.bookDatas else { return }
        var res: CGFloat = 0.0
        for bookInfo in bookDatas {
            res = res + getCellHeight(bookData: bookInfo)
        }
        
        let topConst = self.view.frame.height - res
        if topConst >= 0{
            cstTableViewTop.constant = topConst
        }
        
        
    }

    func getCellHeight(bookData: ModelBookInfo) -> CGFloat {
        return floor(CGFloat(bookData.page / 10))
    }
}


extension StackListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookDatas?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let bookData = bookDatas?[indexPath.row] {
            return getCellHeight(bookData: bookData)
        }
        return 100.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StackListCell", for: indexPath) as? StackListCell
        return cell!
    }
        
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let data = bookDatas?[indexPath.row] {
            (cell as? StackListCell)?.setData(bookInfo: data)
        }
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        (cell as? LibraryBaseCell)?.cancelDownloadImage()
    }
}
