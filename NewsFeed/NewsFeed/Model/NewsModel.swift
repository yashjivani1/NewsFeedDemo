//
//  NewsModel.swift
//  NewsFeed
//
//  Created by Yash Jivani on 17/06/21.
//

import Foundation
import SwiftyJSON
import Alamofire

//30fc4844d5af4decbf374616f8eb9d76
struct NewsModel{
    var title: String
    var urlToImage: URL
    var url: URL
    var author: String
    var publishedAt: String
    
    static func getData(url: URL, completionHandler: @escaping([NewsModel]) -> Void){

         var news = [NewsModel]()
        
//         let url = URL(string: "https://newsapi.org/v2/everything?q=bitcoin&apiKey=30fc4844d5af4decbf374616f8eb9d76")
//         guard let urlTemp = url else{
//             return
//         }
//
//         var request = URLRequest(url: urlTemp)
//         request.httpMethod = "GET"
        
        let request = AF.request("https://newsapi.org/v2/everything?q=bitcoin&apiKey=30fc4844d5af4decbf374616f8eb9d76")
        
        request.responseData{ response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSON(data: data)
                    
                    for new in json.arrayValue{
                        
                        
                        users.append(NewsModel(title: new["title"], urlToImage: new["urlToImage"], url: new["url"], author: new["author"], publishedAt: new["publishedAt"]))
                        
                        
                    }
                    completionHandler(news)
                }catch{
                    print("Cannot parse data")
                }
            case .failure:
                print("Cannot parse data")
            }
        }
        

     }
}
