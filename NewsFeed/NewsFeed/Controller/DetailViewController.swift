//
//  DetailViewController.swift
//  NewsFeed
//
//  Created by Yash Jivani on 17/06/21.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {

    @IBOutlet weak var titlenews: UILabel!
    
    @IBOutlet weak var contentNews: UILabel!
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var descNews: UILabel!
    @IBOutlet weak var editor: UILabel!
    @IBOutlet weak var date: UILabel!
    
    var newData: NewsModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsImage.sd_setImage(with: URL(string: newData.url), completed: nil)
        titlenews.text = newData.title
        contentNews.text = newData.content
        date.text = newData.publishedAt
        descNews.text = newData.description
        editor.text = newData.author
    }
    

   

}
