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
        let notionURL = URL(string: "https://level-map-a4f.notion.site/STUDY-3b22932bb9364494805e9329a0cca7ec")
        let request = URLRequest(url: notionURL!)
        self.webView.load(request)
    }
    
}
