//
//  ArticleModel.swift
//  NewsFeed
//
//  Created by Yash Jivani on 18/06/21.
//

import Foundation

class ArticleModel: NSObject, NSCoding{
    var title: String = ""
    var urlToImage: String = ""
    var url: String = ""
    var author: String = ""
    var publishedAt: String = ""
    var content: String = ""
    var descriptionNews: String = ""
    
    init(title: String, urlToImage: String, url: String, author: String, publishedAt: String, content: String, descriptionNews: String) {
        self.title = title
        self.urlToImage = urlToImage
        self.url = url
        self.author = author
        self.publishedAt = publishedAt
        self.content = content
        self.descriptionNews = descriptionNews
        
    }
    
    
    required override init() {
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(urlToImage, forKey: "urlToImage")
        aCoder.encode(url, forKey: "url")
        aCoder.encode(author, forKey: "author")
        aCoder.encode(publishedAt, forKey: "publishedAt")
        aCoder.encode(content, forKey: "content")
        aCoder.encode(descriptionNews, forKey: "descriptionNews")
    }
    
    required convenience init(coder aDecoder: NSCoder) {
            let title = aDecoder.decodeObject(forKey: "title") as! String
            let urlToImage = aDecoder.decodeObject(forKey: "urlToImage") as! String
            let url = aDecoder.decodeObject(forKey: "url") as! String
        let author = aDecoder.decodeObject(forKey: "author") as! String
        let publishedAt = aDecoder.decodeObject(forKey: "publishedAt") as! String
        let content = aDecoder.decodeObject(forKey: "content") as! String
        let descriptionNews = aDecoder.decodeObject(forKey: "descriptionNews") as! String
        self.init(title: title, urlToImage: urlToImage, url: url, author: author, publishedAt: publishedAt, content: content, descriptionNews: descriptionNews)
        }

}
