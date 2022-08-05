//
//  LookNotionVC.swift
//  Bookjeok
//
//  Created by 이은화 on 2022/08/03.
//

import Foundation
import UIKit
import WebKit
class LookNotionVC: UIViewController{
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let notionURL = URL(string: "https://www.notion.so/Swift-af7693b82a324927bb248f2ff5e4fae8")
        let request = URLRequest(url: notionURL!)
        self.webView.load(request)
    }
    
}
