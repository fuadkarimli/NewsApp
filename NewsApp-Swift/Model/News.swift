//
//  News.swift
//  NewsApp-Swift
//
//  Created by Fuad Karimli on 4/16/22.
//

import Foundation


class News:Codable {
    var title : String?
    var description : String?
    var url : String?
    var urlToImage : String?


    init (title:String,description:String,url:String,urlToImage:String) {
        self.title = title
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
    
        
    }

}
