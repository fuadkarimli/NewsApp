//
//  ViewController.swift
//  NewsApp-Swift
//
//  Created by Fuad Karimli on 4/16/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    var newsList = [News]()
    

    @IBOutlet var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "News"
        
        
        tableView.delegate = self
        tableView.dataSource = self
       
        getData()
    }
    
    
    
    
    
    func getData () {
        
        Webservice().downloadNews { articles in
            if let data = articles {
                self.newsList = data
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let index = sender as? Int
        
        let detailVC = segue.destination as! DetailsVC
        detailVC.newsList = newsList[index!]
    }
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   
        newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let new = newsList[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.labelNews.text = new.title
        cell.labelDesc.text = new.description
        cell.imageNews.layer.cornerRadius = 10
        
        if let url = URL(string: new.urlToImage ?? "" ) {
                   
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url)
                       
                DispatchQueue.main.async {
                    if let data = data{
                        cell.imageNews.image = UIImage(data: data)
                    }
                }
            }
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "to", sender: indexPath.row)
    }



}

