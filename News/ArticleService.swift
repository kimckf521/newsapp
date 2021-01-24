//
//  ArticleService.swift
//  NewsApp
//
//  Created by Kim on 4/9/20.
//  Copyright © 2020 Kim. All rights reserved.
//

import Foundation

struct ArticleService : Decodable {
    
    var totalResults:Int?
    var articles:[Article]?
    
}
