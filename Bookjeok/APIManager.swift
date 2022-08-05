//
//  APIManager.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/07/13.
//

import UIKit
import Alamofire


class APIManager {
    
    static let instance = APIManager()
    
    
    init() {
        
    }
    
    
    func getBookAll(_ handler: (([ModelBookInfo])->Void)? = nil, progress: UIActivityIndicatorView? = nil) {
        progress?.startAnimating()
        AF.request(URL_SEARCH_BOOKALL, method: .get, parameters: nil, headers: nil).responseDecodable(of: ModelSearchBook.self){ response in
            progress?.stopAnimating()
            
            switch response.result {
            case .success(let response):
                handler?(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
