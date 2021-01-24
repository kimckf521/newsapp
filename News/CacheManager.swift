//
//  CacheManager.swift
//  NewsApp
//
//  Created by Kim on 5/9/20.
//  Copyright © 2020 Kim. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url:String, _ imageData:Data) {
        
        // Save the image data along with the URl
        imageDictionary[url] = imageData
        
    }
    
    static func retrieveData(_ url:String) -> Data? {
        // Return the saved image data or nil
        return imageDictionary[url]
        
    }
}
