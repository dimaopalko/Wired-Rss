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
    
    func showAlert() {
        let alertController = UIAlertController(title: "Check your internet connection", message:
            "Go to settings and turn Wi-Fi On!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
        if let url = URL(string: link) {
            webView.load(URLRequest(url: url))
            
        } else {
            
            showAlert()
            
        }
        
    }
}
