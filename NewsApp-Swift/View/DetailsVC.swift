//
//  DetailsVC.swift
//  NewsApp-Swift
//
//  Created by Fuad Karimli on 4/16/22.
//

import UIKit

class DetailsVC: UIViewController {

    var newsList : News?
    
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var imageNews: UIImageView!
    
    @IBOutlet weak var labelDesc: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let newsList = newsList {
            
            
            labelTitle.text = newsList.title
            labelDesc.text = newsList.description
            
            if let url = URL(string: newsList.urlToImage ?? "") {
                       
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                           
                    DispatchQueue.main.async {
                        self.imageNews.image = UIImage(data: data!)
                    }
                }
            }
        }
       

        
    }
    

    

}
