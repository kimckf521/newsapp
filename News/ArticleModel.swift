//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Kim on 4/9/20.
//  Copyright © 2020 Kim. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    func articlesRetrieved(_ articles:[Article])
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        
        // Fire off the request to the API
        
        
        // Create a string URL 2442b5e4ce8d47458af4a8ad25d7c7fb
        let stringUrl = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=8c4d5faa662f4dce849d17d89e86ca14"
        
        // Create a URL object
        let url = URL(string: stringUrl)
        
        // Check that it is not nil
        guard url != nil else {
            print("Could not create url object")
            return
        }
        
        // Get the URL Session
        let session = URLSession.shared
        
        // Create the data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check that there are no errors and that there is data
            if error == nil && data != nil {
                
                // Attempt to parse the JSON
                let decoder = JSONDecoder()
                
                do {
                    
                    // Parse the json into ArticleService
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    
                    // Get the articles
                    let articles = articleService.articles!
                    
                    // Pass it back to the view controller in the main thread
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieved(articles)
                    }
                }
                catch {
                    
                    print("Error parsing the JSON")
                }
                
            }
        }
        
        // Start the data task
        dataTask.resume()
    }
    
}
