//
//  ViewController.swift
//  NewsFeed
//
//  Created by Yash Jivani on 17/06/21.
//

import UIKit
import WebKit
import SDWebImage
class HomeViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var newsData = [NewsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.nib(), forCellReuseIdentifier: NewsTableViewCell.identifier)
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=30fc4844d5af4decbf374616f8eb9d76")
        NewsModel.getData(url: url!) { news in
            DispatchQueue.main.async { [self] in
                self.newsData = news
                
                
                self.tableView.reloadData()
            }
        }
    }
    
    
}



extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier) as! NewsTableViewCell
        cell.newTitle.text = newsData[indexPath.row].title
        let url = URL(string: newsData[indexPath.row].urlToImage)
        let imageView = UIImageView().sd_setImage(with: url, completed: nil)
        cell.newImageView?.sd_setImage(with: url, completed: nil)
        
        cell.editorName.text = newsData[indexPath.row].author
        cell.date.text = newsData[indexPath.row].publishedAt
        cell.newLink.isUserInteractionEnabled = true
        
        let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue  ] as [NSAttributedString.Key : Any]
        let myAttrString = NSAttributedString(string: newsData[indexPath.row].url, attributes: myAttribute)
        
        // set attributed text on a UILabel
        
        cell.newLink.attributedText = myAttrString
        let tap = MyTapGesture(target: self, action: #selector(linkTapped))
        tap.index = indexPath.row
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        
        vc?.newData = newsData[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension HomeViewController{
    @objc func linkTapped(sender : MyTapGesture){
        let webViewController = UIViewController()
        
        let uiWebView = UIWebView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
        if let url = URL(string: newsData[sender.index].url) {
            uiWebView.loadRequest(
                URLRequest(
                    url: url))
        }
        uiWebView.frame = webViewController.view.bounds
        webViewController.view.addSubview(uiWebView)
        
        navigationController?.pushViewController(
            webViewController,
            animated: true)
    }
    
    
}

