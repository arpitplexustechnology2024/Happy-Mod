//
//  WebPlaygameViewController.swift
//  Happy Mod
//
//  Created by Arpit iOS Dev. on 03/07/24.
//

import UIKit
import WebKit

class WebPlaygameViewController: UIViewController {
    
    var urlString: String?
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            loadGame()
        }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

        private func loadGame() {
            guard let urlString = urlString, let url = URL(string: urlString) else {
                print("Invalid URL string")
                return
            }
            let request = URLRequest(url: url)
            webView.load(request)
        }
    
}
