//
//  FeedList.swift
//  Wired Rss
//
//  Created by Dima Opalko on 1/9/19.
//  Copyright © 2019 Dima Opalko. All rights reserved.
//

import UIKit
import FeedKit
import Foundation

let feedURL = URL(string: "https://www.wired.com/feed/rss")!

let parser = FeedParser(URL: feedURL)

var text = ""

public var link = ""

class FeedList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var feed: RSSFeed?
    
    
    @IBOutlet var feedTableView: UITableView!
    
    @IBAction func reloadButton(_ sender: Any) {
        parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { [weak self] (result) in
            
            self?.feed = result.rssFeed
            
            if self?.feed == nil {
                self?.showAlert()
            }
            
            
            DispatchQueue.main.async {
                self?.feedTableView.reloadData()
                
            }
            
        }
    }
    func showAlert() {
        let alertController = UIAlertController(title: "Check your internet connection", message:
            "Go to settings and turn Wi-Fi On!", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.feed?.items?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) 
        cell.textLabel?.text = self.feed?.items?[indexPath.row].title ?? ""
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.feed?.items?[indexPath.row].link != nil {
            link = (self.feed?.items?[indexPath.row].link)!
        } else {
            
            link = ""
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadButton(self)
        
    }
}
    



