//
//  ViewController.swift
//  bookjuk
//
//  Created by 이은화 on 2022/05/25.
//

import UIKit

import Alamofire


class HomeVC: UIViewController {
    @IBOutlet weak var btnCapture: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var btnSee: UIButton!
    @IBOutlet weak var scSwitch: UISegmentedControl!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var stackView: UIView!
    
    var bookDatas: [ModelBookInfo]?
    var bookNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        getBookData()
    }
    
    @IBAction func clickBtnCapture(_ sender: Any) {
//        let searchUrl = try? URLRequest(url: URL_SEARCH_BOOKALL, method: .get, headers: nil)

//        AF.request(searchUrl as! URLRequestConvertible).response { result in
//            if let response = result.response,
//               let data = result.data {
//                print(response.statusCode)
//                print(response.headers)
////
//////                      if let jsonData = json["data"] as? Array<Any>,
//////                         let jsonBook = jsonData[0] as? Dictionary<String, Any>,
//////                         let title = jsonBook["title"] as? String {
//////                        print(title)
////                      }
//                let decoder = JSONDecoder()
//                if let searchBook = try? decoder.decode(ModelSearchBook.self, from: data) as? ModelSearchBook {
//                    print(searchBook.data[0].title) // hyeon
//                }
//            }
//        }
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
    
//    func getBookData() {
//        AF.request(URL_SEARCH_BOOKREAD, method: .get, parameters: nil, headers: nil).responseDecodable(of: ModelSearchBook.self){ response in
//
//            switch response.result {
//            case .success(let response):
//                self.bookDatas = response.data
//
//                self.adjustTableViewTop()
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//    func adjustTableViewTop() {
//
//        guard let bookDatas = self.bookDatas else { return }
//        var res: CGFloat = 0.0
//        for bookInfo in bookDatas {
//            res = res + getCellHeight(bookData: bookInfo)
//        }
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: res).isActive = true
//    }
//
//    func getCellHeight(bookData: ModelBookInfo) -> CGFloat {
//        return floor(CGFloat(bookData.page / 10))
//    }
}

extension HomeVC: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
}

