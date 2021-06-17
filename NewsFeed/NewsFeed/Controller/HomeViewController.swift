//
//  ViewController.swift
//  NewsFeed
//
//  Created by Yash Jivani on 17/06/21.
//

import UIKit
import SDWebImage
class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var newsData = [NewsModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.nib(), forCellReuseIdentifier: NewsTableViewCell.identifier)
        let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=30fc4844d5af4decbf374616f8eb9d76")
       NewsModel.getData(url: url!) { news in
        self.newsData = news
        self.tableView.reloadData()
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
        cell.newLink.text = newsData[indexPath.row].url
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.newData = newsData[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

