//
//  BookDetailVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/08/29.
//

import Foundation
import UIKit
import Alamofire

class BookDetailVC: UIViewController{
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var bookImgView: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    
    @IBOutlet weak var lblHundTerm: UILabel!
    @IBOutlet weak var lblTenTerm: UILabel!
    @IBOutlet weak var lblOneTerm: UILabel!
    
    @IBOutlet weak var lblStart: UILabel!
    @IBOutlet weak var lblEnd: UILabel!
    
    @IBOutlet weak var lblBookIntro: UILabel!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblISBN: UILabel!
    @IBOutlet weak var lblPage: UILabel!
    
    @IBOutlet weak var memoView: UIView!
    
    var data: ModelBookDetail?
    var imageRequest: DownloadRequest?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getBookDetail()
        memoView.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnEdit(_ sender: Any) {
    }
    @IBAction func btnDelete(_ sender: Any) {
    }
    @IBAction func btnBookInfo(_ sender: Any) {
        memoView.isHidden = true
    }
    @IBAction func btnBookMemo(_ sender: Any) {
        memoView.isHidden = false
    }
    
    
    func getBookDetail(){
        AF.request(URL_BOOKDETAIL, method: .get, parameters: nil, headers: nil).responseDecodable(of: ModelBookDetailData.self){ response in
            switch response.result {
            case .success(let response):
                self.data = response.data
                
                if let data = self.data {
                    self.setData(data)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func setData(_ data: ModelBookDetail){
        bookImgView.image = nil
        downloadImageFile(data.thumb)
        lblTitle.text = data.title
        lblAuthor.text = data.writer
        lblStart.text = data.start
        lblEnd.text = data.end
        lblBookIntro.text = data.intro
        lblCompany.text = data.company
        lblISBN.text = data.ISBN
        lblPage.text = String(data.page)
        calReadDate(start: lblStart.text!, end: lblEnd.text!)
        
    }
    
    func downloadImageFile(_ strImgPath: String) {
        guard let imgUrl = URL(string: strImgPath) else {
            return
        }
        
        cancelDownloadImage()
        
        imageRequest = AF.download(imgUrl)
        imageRequest?.response { response in
            if let imageUrl = response.fileURL?.path {
                self.bookImgView.image = UIImage(contentsOfFile: imageUrl)
            }
        }
    }
    
    func cancelDownloadImage() {
        imageRequest?.cancel()
        self.imageRequest = nil
    }
    
    func calReadDate(start: String, end: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd"
        let startDate = dateFormatter.date(from: start)!
        let endDate = dateFormatter.date(from: end)!
        
        let interval = endDate.timeIntervalSince(startDate)
        let days = Int(interval / 86400)
        
        lblHundTerm.text = String(days / 100)
        lblTenTerm.text = String((days % 100) / 10)
        lblOneTerm.text = String(days % 10)
    }
}
