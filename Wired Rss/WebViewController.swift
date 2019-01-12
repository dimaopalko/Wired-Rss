//
//  WebViewController.swift
//  Wired Rss
//
//  Created by Dima Opalko on 1/11/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        if let url = URL(string: link) {
            webView.load(URLRequest(url: url))
            
        }
        
        
    }
}
