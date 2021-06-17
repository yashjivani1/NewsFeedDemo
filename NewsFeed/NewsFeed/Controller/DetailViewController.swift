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
        newsImage.sd_setImage(with: URL(string: newData.urlToImage), completed: nil)
        
        titlenews.text = newData.title
        contentNews.text = newData.content
        date.text = newData.publishedAt
        descNews.text = newData.description
        editor.text = newData.author
        
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        newsImage.addGestureRecognizer(imageTap)
        newsImage.isUserInteractionEnabled = true
        newsImage.addGestureRecognizer(imageTap)
    }
    @objc func imageTapped(sender: UITapGestureRecognizer){
        let image = UIImageView()
        
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ZoomViewController") as? ZoomViewController
        vc?.image = newsImage.image
            self.present(vc!, animated: true, completion: nil)
       
    }
    

   

}
