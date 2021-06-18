import Foundation
import SwiftyJSON
import Alamofire

//30fc4844d5af4decbf374616f8eb9d76
struct NewsModel{
   
    static func getData(url: URL, completionHandler: @escaping([ArticleModel]) -> Void){

        var news = [ArticleModel]()
        
        let request = AF.request(url)
        
        request.responseData{ response in
            switch response.result{
            case .success(let data):
                do{
                    let json = try JSON(data: data)
                   
                    let array = json["articles"].arrayValue
                    for new in array{
                        
                        let article = ArticleModel(title: new["title"].rawString()!, urlToImage: new["urlToImage"].rawString()!, url: new["url"].rawString()!, author: new["author"].rawString()!, publishedAt: new["publishedAt"].rawString()!, content: new["content"].rawString()!, descriptionNews: new["description"].rawString()!)
                        news.append(ArticleModel(title: new["title"].rawString()!, urlToImage: new["urlToImage"].rawString()!, url: new["url"].rawString()!, author: new["author"].rawString()!, publishedAt: new["publishedAt"].rawString()!, content: new["content"].rawString()!, descriptionNews: new["description"].rawString()!))
                        
                        
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
