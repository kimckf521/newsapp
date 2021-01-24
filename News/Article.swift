//
//  Article.swift
//  NewsApp
//
//  Created by Kim on 4/9/20.
//  Copyright © 2020 Kim. All rights reserved.
//

import Foundation

struct Article : Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
}
