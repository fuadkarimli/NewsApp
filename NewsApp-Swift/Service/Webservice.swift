//
//  Webservice.swift
//  NewsApp-Swift
//
//  Created by Fuad Karimli on 4/16/22.
//

import Foundation



class Webservice {
    
    func downloadNews(completion: @escaping ([News]?) -> ()) {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=c638ee1c272d4797a9f37ed1a22bd135") else { return }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            if let error = error {
                
                print(error.localizedDescription)
                completion(nil)
                
            }else if let data = data {
                
                let articleList = try? JSONDecoder().decode(NewsResponse.self, from: data)
                
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                
                print(articleList?.articles ?? "")
            }
        }.resume()
    }

    
}
